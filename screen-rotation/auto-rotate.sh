n
    'normal')
        transformation='normal'
        ;;
    'left-up')
        transformation='90'
        ;;
    'right-up')
        transformation='270'a
        ;;
    'bottom-up')
        transformation='180'
        ;;
    *)
        transformation='normal'  # Default case
        ;
    esac

    # Apply the transformation
    wlr-randr --output "${SCREEN}" --transform "${transformation}"
    sleep 1  # Delay (adjust as necessary)
done

