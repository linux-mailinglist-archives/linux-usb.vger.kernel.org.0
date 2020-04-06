Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0299D19FA55
	for <lists+linux-usb@lfdr.de>; Mon,  6 Apr 2020 18:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729564AbgDFQkR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Apr 2020 12:40:17 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40747 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729560AbgDFQkR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Apr 2020 12:40:17 -0400
Received: by mail-pf1-f193.google.com with SMTP id c20so7792927pfi.7
        for <linux-usb@vger.kernel.org>; Mon, 06 Apr 2020 09:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bgJwQUGkrHo8WkFM5XYCRlm849reBV1dmYwhsL9EaXs=;
        b=HCUrow3q7UgODsxRB0qSihFqHuRuzt3M6E4Kxz5xOJ9qqF1pkSvp+mE/Witb9jovZp
         cGmmsIQDmCMMOoXBR3dY3XHt9BR6HGTL5/2VGBd8qrh6EfGLUEB/Dx3T67H8ExUl1m+I
         3bN7V9UneTlIIhv/oWzyOdegFj42tv1PDlkSh8xPmKxgdWkREmUoiUO64hMDuKfXjegX
         inl96YiXdJ0l9ywc1oe3Mr/+NHEWvpAFEXQuV3FYzT4gDPQQ58n3tZo8oVAsfGRr02/u
         nznhJDQHv5BacI9OgvDpzinZidKTjVKypNl1QUTDl4yoYZUIi1tDuW8sUu/ZqZd2cHHs
         szVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bgJwQUGkrHo8WkFM5XYCRlm849reBV1dmYwhsL9EaXs=;
        b=OYYJHQyyfReSd2ZFDy41kjB+eRv0LxXEI8JdyjXXVRv4npqQNP/IjVb/66OVIRxqo0
         vvuN1w0u0GNPfBnFvEeJKmtd1FhzGBAiL+mPQvV0pr1BzMBW6/NfoCu1GH4vdmaUxtnE
         tLLSG8bE2KQpYJf1CYfUKlLzLkrizThmt43f/Ypftt0LwRmQ8vXeM/TGB2Xm7A04r7Xj
         hCJpxQQU8cgXd4cZQYovE4kWUVQMnNg7/bupmwp9cFthDI5PKT+ORiU5WkSChwpFT0M8
         XAawio4HsMkeegflHMrlllXx5VJuzpfLY9uo0/e1Sy7l4McpAN2JLTwdjG26W5t0Tzab
         TI5A==
X-Gm-Message-State: AGi0PuY57QBNIAknWycfIemkC1xJWtDuah7P47FVp2T/F+fEwdVyoNsh
        c1sZFkKo9EQUftks0err4sRMoXRi6b7Rkirj/N/EAw==
X-Google-Smtp-Source: APiQypK98FYUDlxduCAIqeqe6mfPxyN+ysiZdRjv50nVGM3GR53p48azaK4GXQ2CuQVcCBhE+2BGGq6x3i8ekqht2EE=
X-Received: by 2002:a62:ce48:: with SMTP id y69mr323937pfg.178.1586191215396;
 Mon, 06 Apr 2020 09:40:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200406145119.GG68494@mwanda>
In-Reply-To: <20200406145119.GG68494@mwanda>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 6 Apr 2020 18:40:04 +0200
Message-ID: <CAAeHK+zX-RG5=6pP=k9ofc_1bY1pK+SXrGjAsHmMbc+nVimGxA@mail.gmail.com>
Subject: Re: [PATCH] usb: raw-gadget: Fix copy_to/from_user() checks
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 6, 2020 at 4:53 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The copy_to/from_user() functions return the number of bytes remaining
> but we want to return negative error codes.  I changed a couple checks
> in raw_ioctl_ep_read() and raw_ioctl_ep0_read() to show that we still
> we returning zero on error.
>
> Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, Dan!

Reviewed-by: Andrey Konovalov <andreyknvl@google.com>
Tested-by: Andrey Konovalov <andreyknvl@google.com>


> ---
>  drivers/usb/gadget/legacy/raw_gadget.c | 46 ++++++++++++++++++++++------------------------
>  1 file changed, 22 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
> index 76406343fbe5..e490ffa1f58b 100644
> --- a/drivers/usb/gadget/legacy/raw_gadget.c
> +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> @@ -392,9 +392,8 @@ static int raw_ioctl_init(struct raw_dev *dev, unsigned long value)
>         char *udc_device_name;
>         unsigned long flags;
>
> -       ret = copy_from_user(&arg, (void __user *)value, sizeof(arg));
> -       if (ret)
> -               return ret;
> +       if (copy_from_user(&arg, (void __user *)value, sizeof(arg)))
> +               return -EFAULT;
>
>         switch (arg.speed) {
>         case USB_SPEED_UNKNOWN:
> @@ -501,15 +500,13 @@ static int raw_ioctl_run(struct raw_dev *dev, unsigned long value)
>
>  static int raw_ioctl_event_fetch(struct raw_dev *dev, unsigned long value)
>  {
> -       int ret = 0;
>         struct usb_raw_event arg;
>         unsigned long flags;
>         struct usb_raw_event *event;
>         uint32_t length;
>
> -       ret = copy_from_user(&arg, (void __user *)value, sizeof(arg));
> -       if (ret)
> -               return ret;
> +       if (copy_from_user(&arg, (void __user *)value, sizeof(arg)))
> +               return -EFAULT;
>
>         spin_lock_irqsave(&dev->lock, flags);
>         if (dev->state != STATE_DEV_RUNNING) {
> @@ -530,20 +527,19 @@ static int raw_ioctl_event_fetch(struct raw_dev *dev, unsigned long value)
>                 return -EINTR;
>         }
>         length = min(arg.length, event->length);
> -       ret = copy_to_user((void __user *)value, event,
> -                               sizeof(*event) + length);
> -       return ret;
> +       if (copy_to_user((void __user *)value, event, sizeof(*event) + length))
> +               return -EFAULT;
> +
> +       return 0;
>  }
>
>  static void *raw_alloc_io_data(struct usb_raw_ep_io *io, void __user *ptr,
>                                 bool get_from_user)
>  {
> -       int ret;
>         void *data;
>
> -       ret = copy_from_user(io, ptr, sizeof(*io));
> -       if (ret)
> -               return ERR_PTR(ret);
> +       if (copy_from_user(io, ptr, sizeof(*io)))
> +               return ERR_PTR(-EFAULT);
>         if (io->ep >= USB_RAW_MAX_ENDPOINTS)
>                 return ERR_PTR(-EINVAL);
>         if (!usb_raw_io_flags_valid(io->flags))
> @@ -658,12 +654,13 @@ static int raw_ioctl_ep0_read(struct raw_dev *dev, unsigned long value)
>         if (IS_ERR(data))
>                 return PTR_ERR(data);
>         ret = raw_process_ep0_io(dev, &io, data, false);
> -       if (ret < 0) {
> -               kfree(data);
> -               return ret;
> -       }
> +       if (ret)
> +               goto free;
> +
>         length = min(io.length, (unsigned int)ret);
> -       ret = copy_to_user((void __user *)(value + sizeof(io)), data, length);
> +       if (copy_to_user((void __user *)(value + sizeof(io)), data, length))
> +               ret = -EFAULT;
> +free:
>         kfree(data);
>         return ret;
>  }
> @@ -952,12 +949,13 @@ static int raw_ioctl_ep_read(struct raw_dev *dev, unsigned long value)
>         if (IS_ERR(data))
>                 return PTR_ERR(data);
>         ret = raw_process_ep_io(dev, &io, data, false);
> -       if (ret < 0) {
> -               kfree(data);
> -               return ret;
> -       }
> +       if (ret)
> +               goto free;
> +
>         length = min(io.length, (unsigned int)ret);
> -       ret = copy_to_user((void __user *)(value + sizeof(io)), data, length);
> +       if (copy_to_user((void __user *)(value + sizeof(io)), data, length))
> +               ret = -EFAULT;
> +free:
>         kfree(data);
>         return ret;
>  }
