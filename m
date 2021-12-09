Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61A6C46F5A8
	for <lists+linux-usb@lfdr.de>; Thu,  9 Dec 2021 22:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232619AbhLIVPN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Dec 2021 16:15:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232400AbhLIVPN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Dec 2021 16:15:13 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72CCAC061746
        for <linux-usb@vger.kernel.org>; Thu,  9 Dec 2021 13:11:39 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id 207so10885143ljf.10
        for <linux-usb@vger.kernel.org>; Thu, 09 Dec 2021 13:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0VHxVKMNxpbsAS6suxZ2oIScuIZJZB6v3eScn2zlyfY=;
        b=nNMbDlyWgU2/yKpTmATP3Rsb8X8Lu95CbGgUBAD3TKfniDMmIYe/XZSee7mT8/N1FX
         aA7Kg63CBuT3U97euee212ixI0PK3JXW0tRVFd+ppFy1HF8RMEe7tLLHcTQW32ccvMGC
         QLFHBJh4M4IFkN/BewOR/4v7wLrlvWxHGxd/WiqexD71BgoxeNcAwv44nuOSImwn0aa6
         uYxaFsKHuL7sfLQ+S4eOFirBjO2Lc2G5ST4iqeEOpTeepCskjh/drdwQ34tFsjXVdCNh
         w3voAPBzNIQffSclTseCox8YFbqUiU2+1/hbdcUmzDFm2+Ap194jCXA3zyLCcng+gTBv
         HWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0VHxVKMNxpbsAS6suxZ2oIScuIZJZB6v3eScn2zlyfY=;
        b=I7GCY11D4G4BJTdKw68WZ7ZKiDBOdvwWj5gKAtQhhRwN8zC2wfCFpZYoSvMtJZt+RP
         2RmTbxZ52iqoa8U9McnJ8dDOIzEpDiKa5pk4/7IHUqGmIWyMOxqUrCXsNXqZYg29jUrE
         E6GeJtDOTWFB7tQWS/iLLJ+bVtCTwhCjNkrSQPLMc8/11RacV6Wodd5ETJPJaD3l16My
         2YPIJ+kZs1TX9ZOrU9z1Z3524oH3PDPV0QVGiTLw7AK7D99BWei/QkyakYNzY/cbQBeF
         QJTjYgCrL5X1rXZdxqzCVQQnxih5U+2QICZvNc+H5KAfD3z1j1nf99nJIQry3OTAhn1C
         vNuw==
X-Gm-Message-State: AOAM532nbkXTnaPXbZ8BhnzcUW0aqECe7pCCUgh6LsfPaeQGrAHb6mYZ
        kvlFwG/bc77wlVtc1jSVIrHT04OK0yY=
X-Google-Smtp-Source: ABdhPJwwwd2MPqXy0+5MbNz52Uwz1KMBaXLkaOCnKUcjzdGZd0jNXu1vqZwqNk2P5ECFpdk8dB2WdA==
X-Received: by 2002:a2e:864d:: with SMTP id i13mr8612264ljj.58.1639084297520;
        Thu, 09 Dec 2021 13:11:37 -0800 (PST)
Received: from dell-precision-T3610 (h-98-128-167-144.NA.cust.bahnhof.se. [98.128.167.144])
        by smtp.gmail.com with ESMTPSA id bi34sm106199lfb.12.2021.12.09.13.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 13:11:36 -0800 (PST)
Date:   Thu, 9 Dec 2021 22:11:34 +0100
From:   Lars Gunnarsson <gunnarsson.lars@gmail.com>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v6 0/5] tools/usbip: Patch set summary
Message-ID: <20211209211134.GA12115@dell-precision-T3610>
References: <20211130222254.GA16447@dell-precision-T3610>
 <ea85cb17-69a1-6f6b-d1ab-a75eb73991e1@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea85cb17-69a1-6f6b-d1ab-a75eb73991e1@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 06, 2021 at 01:02:35PM -0700, Shuah Khan wrote:
> On 11/30/21 3:22 PM, Lars Gunnarsson wrote:
> > To forward a remote usb device over usbip the following steps is required:
> > 
> > 1. Execute "usbip bind" on remote end.
> > 2. Execute "usbip attach" on local end.
> > 
> > These steps must be perfomed in above order and after usb device is plugged in.
> > If the usb device is unplugged on the remote end the steps above needs to be
> > performed again to establish the connection. This patch set implements a feature
> > to persistently forward devices on a given bus. When using flag "-p|--persistent"
> > on remot end, the USB device becomes exported when plugged in. When using flag
> > "-p|--persistent" on local end, the USB device becomes imported when available
> > on remote end. Thus it is only required to run the usbip command once on each
> > end, in any order, to persistently forward usb devices on a given bus.
> > 
> > This is sent in five separate patches:
> >    tools/usbip: update protocol documentation
> >    tools/usbip: update manual pages
> >    tools/usbip: add usb event monitor into libusbip
> >    tools/usbip: export USB devices on a given bus persistently
> >    tools/usbip: import USB devices on a given bus persistently
> > 
> 
> When -p is used, the command stays in foreground. This is a very
> different use model compared to current model. In addition, once
> persistent flag is set on a bus, all devices even the ones that
> are inserted in the future get exported. What happens if one of
> the devices shouldn't be exported?

Yes it's conceptually more like exporting/importing the physical usb port,
rather than exporting/importing a device plugged into the usb port. Using flag
"-p" on both ends will behave like a "virtual" usb hub, a device plugged in on
the server (on a chosen bus) will automatically be available on the client.
Using flag "-p" has no dependency on the other end though. Using "-p" on one end
doesn't enforce usage on the other end. It is only for exporting and importing
devices automatically when they become available.

There might be better choices than naming flag to "persistent" for easily
communicate this concept. Would "port" be more intuitive?
"usbip attach --port 3-3.1" and "usbip bind --port 3-3.1"

> 
> There are several conditions to be thought through:
> 
> - What happens if if the command that is running on the foreground
>   is killed on either end?

If "attach" cmd gets killed (client side) it will stop the foreground
monitoring. The device will still remain imported if user exit at imported state.
The user then needs to manually unimport the device with "detach".

If "bind" cmd gets killed (server side) it will stop the foreground monitoring.
The device will still remain exported if exit at exported state. The user then
needs to manually unexport the device with "unbind".

> - What happens when one or more devices are detached?

If user exit from "attach" cmd running in foreground, followed by detaching the
device manually, it will work as previously. The device will become available on
the server for importing again.

If user running "attach" cmd in foreground, while executing "detach" manually
from another terminal or similar, the foreground "attach" command will detect
the disconnection and re-establish the import. I don't see any use case for
this, it's just for explaining.

If user running "attach" cmd in foreground, while the remote device becomes
unexported (or disconnected) it will start polling the usbipd.
When a device becomes exported on the chosen bus it gets imported immediately.

> - What happens when one or more devices are unbound from
>   the server?
> 
> Let's walk through these scenarios.

If user exit from "bind" cmd running in foreground, followed by unbind the
device manually it will work as previous. The usb device will become available
on the server again.

If user running "bind" cmd in foreground, while executing "unbind" from another
terminal or similar, the foreground "bind" command will detect the unexport
and re-establish the export. I don't see any use case for this, it's just for
explaining.

If user running "bind" cmd in foreground, while the device becomes unexported
or disconnected it will restart monitoring the busid. When a device becomes
plugged in on the chosen usb port it gets exported immediately.

One option to consider is to unexport & unimport the device at exit, but this
comes with the cost of creating a source code dependency between
bind --> unbind and attach --> detach.

Best regards, Lars

> 
> thanks,
> -- Shuah
> 
> 
