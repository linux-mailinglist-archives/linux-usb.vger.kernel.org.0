Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6A1A41066C
	for <lists+linux-usb@lfdr.de>; Sat, 18 Sep 2021 14:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235323AbhIRMeO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 Sep 2021 08:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233144AbhIRMeG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 18 Sep 2021 08:34:06 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0F0DC061574
        for <linux-usb@vger.kernel.org>; Sat, 18 Sep 2021 05:32:42 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id b21-20020a1c8015000000b003049690d882so11951454wmd.5
        for <linux-usb@vger.kernel.org>; Sat, 18 Sep 2021 05:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=W4RY4WLV6Z4od8cR681FtunV24OGcqWnMGcwRnir/BM=;
        b=mh2EHdZd8Lgok7eTuNhmO8OFQCe9T0g8f29nd0Eb1l6fR5TfXijDBiZOBXIJUH3lbx
         GLBptHIMtLFl6ik2FENggkhduHMBtC5goqCdqWZWzdpsYBNb5pnW6tLJrIbUfnHoru2Z
         rASfHhJCYTNY2iXKAs/dB4ufaILmsDNCXDSHPsX3roPHJakTtC3AmnfukJrlIdu8MV76
         w+QM5/xN44w8hon8S+UWyzK1FcF3aD0p4A9ZS5P4NdVQuL6aAliZ1vBOZK3359UvAJy+
         UWdhb6V3oUW9dY1DB9wVhAHu275s+qltvK7ZizxDzZ9Rw2kT7GdbbO+HI41hcB3HXFuj
         V5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=W4RY4WLV6Z4od8cR681FtunV24OGcqWnMGcwRnir/BM=;
        b=amsTECPMi+WhbjJUYI42SquThMimMqjjcNb/pcMdAbx/t92wfX5nP5waXvd3FZ8eB5
         XpMj7XziZz+6FaPY/amZirwFHM9HjsRYBpL1SmVhc5OwQWCIGdYT18/IsgCLNkVJ2gJH
         borSqWnRQGzTmb8ignBfdysQH++B9P+Acsq8MtnQCcGac9X7rpF3JSf0nhSiUheu5fQ2
         RZpoS4oRDrqKv+Z14gt3RswQCfL3ZE0i7nXQE0a6ZfR8R18WWP8ZQIU+TVDVzksxP2sI
         JaTLTZwh5sQV2rlmtaMLlvOvlvbYEPoi49k2JZYXhWNau1VZ/6wNJmI+DM8T8HK6Rqqk
         YjmQ==
X-Gm-Message-State: AOAM531ThRBXgjZ7RjHYCnMVBYnw7FunF3SEWv1m9QwrPB7osH0pQwiA
        yFdBl05vTOJzVDT+ISZtxh2/WSU+NHS7Lw==
X-Google-Smtp-Source: ABdhPJxXpeuauUqnw39NsrhZLyduVst31IblqNwZ0zcc5rnnL+7u9tapF0g1h+qucnzuR1mjfda9MQ==
X-Received: by 2002:a1c:21c3:: with SMTP id h186mr20275341wmh.18.1631968361368;
        Sat, 18 Sep 2021 05:32:41 -0700 (PDT)
Received: from eldamar (80-218-24-251.dclient.hispeed.ch. [80.218.24.251])
        by smtp.gmail.com with ESMTPSA id i9sm14041056wmi.44.2021.09.18.05.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 05:32:40 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Date:   Sat, 18 Sep 2021 14:32:40 +0200
From:   Salvatore Bonaccorso <carnil@debian.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH] Partially revert "usb: Kconfig: using select for
 USB_COMMON dependency"
Message-ID: <YUXcaBR3Yh4PqMxN@eldamar.lan>
References: <20170418023639.GE4152decadent!org!uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170418023639.GE4152decadent!org!uk>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

This is a reply to a very old patch submission:

On Tue, Apr 18, 2017 at 02:36:39AM +0000, Ben Hutchings wrote:
> 
> This reverts commit cb9c1cfc86926d0e86d19c8e34f6c23458cd3478 for
> USB_LED_TRIG.  This config symbol has bool type and enables extra code
> in usb_common itself, not a separate driver.  Enabling it should not
> force usb_common to be built-in!
> 
> Fixes: cb9c1cfc8692 ("usb: Kconfig: using select for USB_COMMON dependency")
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> ---
>  drivers/usb/Kconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
> index fbe493d44e81..8270abe6c677 100644
> --- a/drivers/usb/Kconfig
> +++ b/drivers/usb/Kconfig
> @@ -154,8 +154,7 @@ source "drivers/usb/gadget/Kconfig"
> =20
>  config USB_LED_TRIG
>  	bool "USB LED Triggers"
> -	depends on LEDS_CLASS && LEDS_TRIGGERS
> -	select USB_COMMON
> +	depends on LEDS_CLASS && USB_COMMON && LEDS_TRIGGERS
>  	help
>  	  This option adds LED triggers for USB host and/or gadget activity.

Was going through the series of patches we had applied in Debian and
noticed while this was submitted by Ben back in 2017, it looks it was
never applied or considered. Would that be something you could pick
up? I'm inlining the original patch from Ben.

Regards,
Salvatore

From: Ben Hutchings <ben@decadent.org.uk>
Date: Wed, 11 Jan 2017 04:30:40 +0000
Subject: Partially revert "usb: Kconfig: using select for USB_COMMON  dependency"

This reverts commit cb9c1cfc86926d0e86d19c8e34f6c23458cd3478 for
USB_LED_TRIG.  This config symbol has bool type and enables extra code
in usb_common itself, not a separate driver.  Enabling it should not
force usb_common to be built-in!

Fixes: cb9c1cfc8692 ("usb: Kconfig: using select for USB_COMMON dependency")
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 drivers/usb/common/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/common/Kconfig b/drivers/usb/common/Kconfig
index d611477aae41..196f4a397587 100644
--- a/drivers/usb/common/Kconfig
+++ b/drivers/usb/common/Kconfig
@@ -6,8 +6,7 @@ config USB_COMMON
 
 config USB_LED_TRIG
 	bool "USB LED Triggers"
-	depends on LEDS_CLASS && LEDS_TRIGGERS
-	select USB_COMMON
+	depends on LEDS_CLASS && USB_COMMON && LEDS_TRIGGERS
 	help
 	  This option adds LED triggers for USB host and/or gadget activity.
 
