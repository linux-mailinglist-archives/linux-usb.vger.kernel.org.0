Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC7B65A682
	for <lists+linux-usb@lfdr.de>; Sat, 31 Dec 2022 20:49:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbiLaTt2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 31 Dec 2022 14:49:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235877AbiLaTtO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 31 Dec 2022 14:49:14 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5129C614F
        for <linux-usb@vger.kernel.org>; Sat, 31 Dec 2022 11:49:12 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id m8-20020a05600c3b0800b003d96f801c48so15651135wms.0
        for <linux-usb@vger.kernel.org>; Sat, 31 Dec 2022 11:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syDxdp/ZIICPUj9udAGICLKikJluPOFyrXJTco8Sw9g=;
        b=kUanQArK89AhQ6WNGxPltIjMsx6wPFW1dHSlIDeZ3fH3l5PRGLxFcEEqnRRvT2JDjz
         GwMEGb9roCM7CA5eaFQXEGRst+/Muul2Ta+AZWhoxj//0xBZ5WTX/UFs2nDkUp31J2zT
         //ibMEIX0Sy5NdXwfRvq3m6C6MBPVJvaosp4juTVj8MunzUs/GLDf02R5mGXnnvCcirq
         WLRBkJvPUhHGZ4S9EKr91TPLN3F+oS7IfqDMGobPgynptEVB5vqlOBf7802YOVJSY6s8
         tt8uVVGE4Y3NPzCkWyxTJNX7qBGnqYnyo9boYRO2P6zCLQyAe+hm5BbBpBd6Rl77UcG9
         SVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=syDxdp/ZIICPUj9udAGICLKikJluPOFyrXJTco8Sw9g=;
        b=7uLtH7T/gTDAUKSVrReVBomFCfKBhcmQGl7PBnjb99PYtQfwoXc86TPc3kk/rNgP7u
         KdTF6e2QFap3qFl5uPJF+zyuVVj07llSXVO2/o+qgTNjpqHkWaVrZRCdJzWi0S87YLFc
         TGhf7VlPEAIUNgpQDpM6qPMV4/vU/x+phBFfupI3QJUv60TejOJlAe0qy4PsDnQIJf8G
         PJkSt1Myv01DROGwr1MBfy4eQtruZRVwVmd/XKsh75SNcuJjs5q+zRX0l3Ocjjpswaxg
         e2I40Z4GS3FXqTwKf9NQYhjO41s+uxADWTJ5ifmJWmKj9uxeYRYonjF6KUauTBFwK+NI
         EOqQ==
X-Gm-Message-State: AFqh2koAhupLRtWF0mN2b+13SrusFK00kucHkWCBKlZksZ8vU7tq/0JO
        KjLnjdE9Ks/KIm13uMdfgnLqjJrBoI0=
X-Google-Smtp-Source: AMrXdXttnAPjI1doO7t9pX6CuCsrCmyRWxtl5M7vKJ/vQF7Dpv16jAssJwS3MT4zWeDV5L6+P1k1uw==
X-Received: by 2002:a05:600c:3d86:b0:3d1:e04f:9bfa with SMTP id bi6-20020a05600c3d8600b003d1e04f9bfamr27215110wmb.28.1672516150247;
        Sat, 31 Dec 2022 11:49:10 -0800 (PST)
Received: from jo-einhundert ([2a02:908:13d6:2180:d378:a57a:33df:e53c])
        by smtp.gmail.com with ESMTPSA id m16-20020adffe50000000b00241bd7a7165sm26807918wrs.82.2022.12.31.11.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Dec 2022 11:49:09 -0800 (PST)
Date:   Sat, 31 Dec 2022 20:49:08 +0100
From:   =?iso-8859-1?Q?J=F3_=C1gila?= Bitsch <jgilab@gmail.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        Dmitrii Pasechnik <dima.pasechnik@cs.ox.ac.uk>
Subject: Re: usb 1-3: Product: BBC micro:bit CMSIS-DAP not recognised
Message-ID: <Y6ciGZ1D0Hcb6Uua@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> On Fri, Dec 23, 2022 at 11:41:03PM +0000, Dmitrii Pasechnik wrote:
> > On Fri, Dec 23, 2022 at 09:52:50AM -0500, Alan Stern wrote:
> > > On Fri, Dec 23, 2022 at 12:58:41PM +0000, Dmitrii Pasechnik wrote:
> > > > On Thu, Dec 22, 2022 at 04:24:55PM -0500, Alan Stern wrote:
> > > > > A bit off to the side from the main point of this thread, but...
> > > > > 
> > > > > On Thu, Dec 22, 2022 at 10:32:09AM +0000, Dima Pasechnik wrote:
> > > > > > 
> > > > > > 
> > > > > > On 20 December 2022 19:57:05 WET, Alan Stern <stern@rowland.harvard.edu> wrote:
> > > > > > >> USB Interfaces: MSD, CDC, HID, WebUSB
> > > > > > >
> > > > > > >Which agrees with the information on the web site.  I have no idea what 
> > > > > > >WebUSB is supposed to be.
> > > > > > 
> > > > > > WebUSB is a JavaScript API, supported by Chromium -derived browsers (Firefox not there yet)
> > > > > > 
> > > > > > https://en.wikipedia.org/wiki/WebUSB
> > > > > 
> > > > > The Wikipedia article agrees with you that WebUSB is a JavaScript API.  
> > > > > As such, it is used for communication between web browsers and 
> > > > > JavaScript programs.
> > > > 
> > > > No, it's used by browsers (which  run JavaScript code in them) to
> > > > communicate with USB hardware. Or, if you like,
> > > > standalone JavaScript programs to communicate with USB hardware. 
> > > > Let me copy from the wiki here:
> > > > 
> > > > ---------------------------------
> > > > A Universal Serial Bus, or a USB is an industry standard [...]
> > > > WebUSB is a set of API calls that enable access to these hardware
> > > > devices from web pages. WebUSB is developed by the World Wide Web
> > > > Consortium(W3C).[1] The webUSB API provides a safe, and developer
> > > > familiar means of communication to edges devices from web pages. The
> > > > webUSB API integrates into existing USB libraries and shortens the
> > > > development cycle for integrating new devices into the web environment
> > > > by not needing to wait for browser support for these devices.
> > > > 
> > > > Early versions of webUSB came out around as an alternative to Flash,
> > > > Chrome Serial, and other custom approaches to connecting browsers to
> > > > hardware. WebUSB aims to solve the four goals of any interface being;
> > > > fast to make, cross platform, look good, accessibility.
> > > > 
> > > > >  Not for communication between programs and USB 
> > > > > devices.  So I don't understand why a USB device needs to be concerned 
> > > > > about it.
> > > > 
> > > > I hope the above explains.
> > > 
> > > Actually, it's ambiguous.
> > > 
> > > The article says that WebUSB is an API used by JavaScript programs when 
> > > they want to interact with a USB device.  Which means it is something 
> > > that JavaScript programs can know about and interact with.  Fine.
> > > 
> > > But the article doesn't say what happens on the device's side of the 
> > > conversation.  Does the WebUSB framework use some special messages when 
> > > communicating with a USB device, so it will only work with devices which 
> > > support WebUSB's protocol, or does it use plain ordinary USB messages 
> > > which any USB device will support?
> > > 
> > > To put it another way, do USB devices need to have specialized firmware 
> > > in order to be compatible with WebUSB, or will WebUSB work with all USB 
> > > devices?  If the latter is true then why does the BBC micro:bit device 
> > > have a special WebUSB interface?  Does the extra interface provide some 
> > > sort of device-specific information which WebUSB can make use of but 
> > > which isn't essential?
> > 
> > here is what I could find about the device side of WebUSB: https://web.dev/build-for-webusb/
> > Basically, WebUSB support offers some extras, e.g. one can get a
> > specific pop-up with a URL in it (supplied by the board) in the web browser as
> > the device is plugged in the USB port.
> > 
> > Also, on the software side, this: https://developer.chrome.com/articles/usb/
> > is more informative than the Wikipedia article.
> > And here is how WebUSB-capable device is meant to talk ot the machine
> > it's plugged in: https://wicg.github.io/webusb/#webusb-platform-capability-descriptor
> 
> Those are very helpful, thank you.
> 
> Interestingly, none of those documents mentions anything about having a 
> special WebUSB interface in the configuration.  The WebUSB information 
> on a device is accessed using standard or vendor-specific control 
> messages with the device (not an interface) as recipient.  So the 
> question of why the micro:bit has a WebUSB interface remains a 
> mystery...
> 
> Alan Stern

I may be able to shed some light on this:

TLDR:

There are 2 separate "serial" interfaces, one to control via the normal OS character device,
and one to connect to via a browser.

More details:

The reason for this additional interface is that WebUSB does not have any facilities
to detach the kernel driver, so once the kernel claimed a specific interface, say
/dev/ttyACM0, it is no longer accessible to WebUSB. (It would still be able to access the
serial port via WebSerial, but that browser feature is newer than WebUSB.)

The way out for Micro:bit and many similar boards, is to provide an additional vendor-specific
interface, that provides the same functionality as serial/ACM, but uses different class
descriptors, so the kernel doesn't claim it and a Javascript application can access it.
Therefore, you can access the device via the browser AND via /dev/ttyACM0.

This allows more flexibility for the user to use either mechanism.

Therefore, it would actually defeat the purpose, if the OS claimed that extra serial interface
itself, as the browser could no longer claim it.

Then again, the better way to implement this specific feature would probably for the website
to use WebSerial to access the serial port instead.

Incidentally, I posted a patch yesterday, that would allow Linux-based USB gadgets to
announce it's WebUSB landing page URL via a device capability BOS descriptor and a 
WebUSB-defined vendor specific call. This implements the optional device side parts of WebUSB,
that enables better discoverability from the user side.

Note: To access a device through WebUSB, it is not strictly necessary to change anything on
the device side. Just make sure you have permissions and the kernel didn't claim the interface
already. The browser also requires explicit user interaction to allow access.

(In current Chrome, the feature to show the popup on device insertion is behind a flag:
chrome://flags/#enable-webusb-device-detection)

Best regards,
Jó
