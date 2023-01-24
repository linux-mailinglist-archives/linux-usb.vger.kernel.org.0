Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA257679D72
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jan 2023 16:28:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234971AbjAXP2B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Jan 2023 10:28:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234953AbjAXP17 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Jan 2023 10:27:59 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C2618F
        for <linux-usb@vger.kernel.org>; Tue, 24 Jan 2023 07:27:49 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id qx13so39883358ejb.13
        for <linux-usb@vger.kernel.org>; Tue, 24 Jan 2023 07:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9K4VINx5OKjEA306fu/v7ErNDQ2+AySRwfVGcdjkuNE=;
        b=eMSnOdN7gUPWZU6M/OsLCIvxUIoN264+Mcl7IToOu64/xDg0TWt2bWNvzb8N6z+Axt
         +hS/yXLWPv8ohGrVMtdiaTrNe8v0a89WBD7r56s0CBlkETknif9xoPJTTsUpvL3941lX
         wzVAFaON8oaaKrt+puBgyJ3N6vtc+e3sHtG0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9K4VINx5OKjEA306fu/v7ErNDQ2+AySRwfVGcdjkuNE=;
        b=BkczTvWtQ/d9AsQroilwF3YVA8zCZYgExp0s4SQbkWIXHEZYxMsjXyUZxiS/rX2Ri8
         qOgDIFRaACHUCwVOmyE/vMy7+kmqXFS6UUqVMf2zUdE3HdBXmhlC0Wpuk0PW6WW3d42d
         IVtovMdDMrpQLkNQdtA+ebdr6kmSbYuBD9BdDEbN+QMs+75EkbxmbPvsC6UA28eVVYQR
         CmoP0EC2K3DhKA2SRkohrflPDWQ6c/VNA91yURkiiRXjtizhWaOW7t73B8Hwy6zENEAq
         2DONeKnUwArAyz1mSlib6VUBF/HvGjW+XhJ5u4SWKbaa1qz4B1uiN4ZTXvYP6pqdHQRh
         laeg==
X-Gm-Message-State: AFqh2kpK+0j47wXdoOCOcc85Q1kqo7Mes3FqEmQc/9B/n/plBZN2kQ/s
        csZQ0SE0WTsgiOol+Tg17YQf3ni4NfNQncvu+l0byw==
X-Google-Smtp-Source: AMrXdXuX/ATUdqKG9nCy8XT8y4LmKHnV6+AhNvip4pbLjczyHUqkHSTSTMvMK+6DlLiOveSKXT2O6c0IoDVfLYXf6qo=
X-Received: by 2002:a17:906:e087:b0:870:450d:c2b1 with SMTP id
 gh7-20020a170906e08700b00870450dc2b1mr2768970ejb.45.1674574067831; Tue, 24
 Jan 2023 07:27:47 -0800 (PST)
MIME-Version: 1.0
References: <20230120205827.740900-1-pmalani@chromium.org> <20230120205827.740900-2-pmalani@chromium.org>
In-Reply-To: <20230120205827.740900-2-pmalani@chromium.org>
From:   Benson Leung <bleung@chromium.org>
Date:   Tue, 24 Jan 2023 07:27:33 -0800
Message-ID: <CANLzEkvmCOR3B-Sx3z=wyPB+6h_OyvbHqhsShAiT368N1-3pFQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] usb: typec: tcpm: Remove altmode active state updates
To:     Prashant Malani <pmalani@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        Guenter Roeck <linux@roeck-us.net>,
        Benson Leung <bleung@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_SPF_WL
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 20, 2023 at 1:00 PM Prashant Malani <pmalani@chromium.org> wrote:
>
> Since the "active" state for partner altmodes is now being taken care of
> by the altmode driver itself (specifically, DisplayPort altmode), we
> no longer need to do so from the port driver. So remove the calls to
> typec_altmode_update_active() from TCPM.
>
> Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>
> Changes since v1:
> - Patch first introduced in v2.
>
>  drivers/usb/typec/tcpm/tcpm.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 904c7b4ce2f0..0f5a9d4db105 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -1693,14 +1693,11 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
>                         }
>                         break;
>                 case CMD_ENTER_MODE:
> -                       if (adev && pdev) {
> -                               typec_altmode_update_active(pdev, true);
> +                       if (adev && pdev)
>                                 *adev_action = ADEV_QUEUE_VDM_SEND_EXIT_MODE_ON_FAIL;
> -                       }
>                         return 0;
>                 case CMD_EXIT_MODE:
>                         if (adev && pdev) {
> -                               typec_altmode_update_active(pdev, false);
>                                 /* Back to USB Operation */
>                                 *adev_action = ADEV_NOTIFY_USB_AND_QUEUE_VDM;
>                                 return 0;
> --
> 2.39.0.246.g2a6d74b583-goog
>


-- 
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org
