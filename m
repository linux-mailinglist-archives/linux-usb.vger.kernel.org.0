Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D4073DC146
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jul 2021 00:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233158AbhG3Wwl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Jul 2021 18:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbhG3Wwk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Jul 2021 18:52:40 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97284C06175F
        for <linux-usb@vger.kernel.org>; Fri, 30 Jul 2021 15:52:33 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id 21so15301024oin.8
        for <linux-usb@vger.kernel.org>; Fri, 30 Jul 2021 15:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7YaEvaHo4DrC0W6456B2yUlU59Vy6Pd8qtDVybWHYoQ=;
        b=QmiSOesf5CY5VSmypoZf0BlSlPuupVnb2fKUGKiCKMoKiZjGumEQntKXIGI6X9FERi
         sqcVq0JNz6OFTebyDquEYoD+ei3R6ov/Wiq+CZAHqKxoy8cMXuc1OVUDyAj4YHQmlIzY
         TeHYCg2yv+3v2ml1Fne/PbECazZZyZcjvHkPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7YaEvaHo4DrC0W6456B2yUlU59Vy6Pd8qtDVybWHYoQ=;
        b=g+cHDJZaX25uf8rTDUkDlF8bL1fJJ5DxuSDl29TDCwIG7KZnoe8NdsD13FIWH0uH4/
         3hPMH0KB4sUXDIn7yE+m0tnS7HqkR3hZE1+iYhom3z9zYs87surwK2CTtnidBkwlm0oW
         k/NGRduYi7cVAGzWw1cE+zzIbQTzytWuFpUpJKcFdRcAhhtmokaQVXxMdbBO4pBj39YV
         4LaZdHG7XBnXSOrLonSxPWh9pjSrG630+QLLPgJt1ZAR3E0M1Wt0RE1eGDrF/eRBb1uI
         qEJvMeZo7yPJENx/UFJ6cwpOeWt9CiJyV5qIqUQc9zAvmIFl+63ljDXB5ojt3cOuV2pW
         +c+w==
X-Gm-Message-State: AOAM530CYYZEa7QArqUWS6ashhPOlAPXhZju3c3TAN4bVG1mmEICd8Lr
        nFno1RWcyLE3srIFl7UyyDKIOQ==
X-Google-Smtp-Source: ABdhPJyavFpbeFUiYZt3tWXuUIvQDxsX6/mrUaQ2REGi6SfE3NPcnP1mV6nBy9R+P9dmYS3pWR9m8A==
X-Received: by 2002:a54:459a:: with SMTP id z26mr3490294oib.91.1627685552906;
        Fri, 30 Jul 2021 15:52:32 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id o101sm539525ota.61.2021.07.30.15.52.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jul 2021 15:52:32 -0700 (PDT)
Subject: Re: [PATCH v2] vhci_hcd: USB port can get stuck in the disabled state
To:     Michael <msbroadf@gmail.com>
Cc:     valentina.manea.m@gmail.com, shuah@kernel.org,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20210721235526.10588-1-msbroadf@gmail.com>
 <7b02cb66-d672-ae95-01ea-c6015725e1ac@linuxfoundation.org>
 <CALdjXpA4_eXen6RjhsEBYt8CQs-2gzwYs9h9q0Z2LKZ=rXVp+Q@mail.gmail.com>
 <ad07410b-05d6-6a12-13df-14e31cbf50ff@linuxfoundation.org>
 <CALdjXpBPRraC8xxORgE3SXw4xFnTW-Y6rLbcS+Cx0xYq3+aBeQ@mail.gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <976d34c0-d603-1f16-edbd-ad6c8881ad4e@linuxfoundation.org>
Date:   Fri, 30 Jul 2021 16:52:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CALdjXpBPRraC8xxORgE3SXw4xFnTW-Y6rLbcS+Cx0xYq3+aBeQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/23/21 5:58 PM, Michael wrote:
> Here is the lsusb on the client when the device fails to attach
> ---------------------------------------
> michael@ubuntu:~$ lsusb
> Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 004 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
> Bus 003 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
> Bus 002 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
> 
> 
> Here is the lsusb on the host before use
> -----------------------------------------------------
> pi@raspberrypi:~ $ lsusb
> Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 001 Device 003: ID 045e:02e6 Microsoft Corp. Wireless XBox Controller Dongle
> Bus 001 Device 002: ID 2109:3431 VIA Labs, Inc. Hub
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> 

Sorry for the delay on this. I had to make time to do some research on
usb_reset_device() calls from probe routines.

 From what you said in another email:

"The device is in the  VDEV_ST_USED state when a reset occurs and so its
never re-enabled"

Right if device is in VDEV_ST_USED state, vhci treats reset as invalid.

Your commit log says:

"When a remote usb device is attached to the local Virtual USB
Host Controller Root Hub port, the bound device driver may send a
port reset command. For example to initialize firmware (eg. btusb does this).
This port reset command can be sent at any time, however the VHCI hcd
root hub is only expecting reset to occur before the device receives
SET_ADDRESS. The USB port should always be enabled after a reset
(because the port is virtual and there is no possibility of hardware errors)"

It appears btusb driver issues reset as a workaround: btusb_setup_intel()

        /* The controller has a bug with the first HCI command sent to it
          * returning number of completed commands as zero. This would stall the
          * command processing in the Bluetooth core.
          *
          * As a workaround, send HCI Reset command first which will reset the
          * number of completed commands and allow normal command processing
          * from now on.
          */

Another "Toggle the hard reset line" workaround for Realtek devices:
See btusb_rtl_cmd_timeout()

Both of these cases are workarounds. Is this what you are referring to about
btusb doing reset?

Specific to this bug report and mt76, other network/wireless usb drivers
call usb_reset_device() from their probe routines unconditionally. These
are the calls from normal paths and not fw load/error paths.

rtl8152_probe(), carl9170_usb_probe(), mt7663u_probe() and so on. Looking
at these probe routines, it appears some of them do that to avoid problems
in disconnect path.

I have two questions:
- Is it necessary to do usb_reset_device() in net/wireless usb driver
   probe routines?
- Are these legit calls according to protocol?

If yes, we can look into changing vhci to handle this case for net/wireless
usb drivers. I would not delete the check though. I would add VDEV_ST_USED
check in addition to VDEV_ST_NOTASSIGNED with some comments on why this is
necessary.

Furthermore there is a bug in the line pr_err("vhci_device speed not set\n");
(L479) because resetting a full-speed device is not an error.

This is a separate issue is separate. vhci is missing USB_SPEED_FULL checks
at various places. This has to be done as a separate work.

thanks,
-- Shuah


