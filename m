Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 821B9192EFB
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2020 18:13:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727564AbgCYRNN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Mar 2020 13:13:13 -0400
Received: from mail-pf1-f169.google.com ([209.85.210.169]:42149 "EHLO
        mail-pf1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbgCYRNN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Mar 2020 13:13:13 -0400
Received: by mail-pf1-f169.google.com with SMTP id 22so1343448pfa.9;
        Wed, 25 Mar 2020 10:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:to:cc:subject:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=RXLxeC9OROmQQXYGBBBEvN5sljiBTZ5VVdFyLA+6ua4=;
        b=e0Ed5MpREuQ7o1oPQZGuPjGHKWcFg4OGWmXLOH0qOcZrgFs8+q55lZ0VyEt4zyDCu0
         nbNBjBVJWBq4+9p0e08lTof4j3m+Ikdzpwkm5DadcWo9a6TKGAwXScW24KlcLL7gapsc
         +omZRWNNfTI0/z17YeAkDV63aBEOcyr4hciF/gxQ6ZhzfAL+W69s1H7eCPNikyH0N7K+
         P8YL2f99uA+1t4/aFE965BWaT+qk/ju0Lte+JIQfcol9ioaHC7YePgSd7Z5PT5khb/Pv
         W1EhR5V4r2TZLbD1KMPvg94sjMczD2McgrodCfRDUPCxdukC9zXvikbc+/vnc1/BBC8z
         1Bfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=RXLxeC9OROmQQXYGBBBEvN5sljiBTZ5VVdFyLA+6ua4=;
        b=aZBFniukyRkny5w5OrGTIWfGUP1lIOgwB5NxrMwxAJwbIW6HH6V1xD/Q1IgwHd3RU4
         +iA1KlMjyNMbiZn9nBRYPIp3wtouV3GlVA9K1dgGumOKBOVVPrHSvmIb6ADSHFpmhg+9
         5qFxg5w1GF3iMKeOBL/MioIcFttkju2q2aqVfqSKMX887C+wYwm9T/M5bz33MfR52fX/
         uBvVDfAMAhmkOPWm7OgZI/d7uofhanQFwV28gWd/NKw6JlC0QZ2FDSKDIcRRgf/FJ5eI
         seNYfM8h+aU5xsEv0JCSD4tMYaQhMZoOElbsckM82TRPEQu3kqI+vCAVX52J4g7c4ddc
         is5w==
X-Gm-Message-State: ANhLgQ0WuODDINVkYz168cuaCjWV0g259J2S6v9FJiO7u5ATr5jmy+lh
        hVavG+wMWSQpFlEVWs2jd6SqtD3O
X-Google-Smtp-Source: ADFU+vs86ffP/e+SCry5iFxYjVSnYEt4s2soEoNVz+crbuyUfCEt36uuqUmX7ftfYOCzwhBDU7YFhA==
X-Received: by 2002:aa7:9695:: with SMTP id f21mr4510450pfk.93.1585156392040;
        Wed, 25 Mar 2020 10:13:12 -0700 (PDT)
Received: from SARKAR ([106.51.108.92])
        by smtp.gmail.com with ESMTPSA id nu13sm5186359pjb.22.2020.03.25.10.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 10:13:11 -0700 (PDT)
Message-ID: <5e7b9127.1c69fb81.f2f8b.582c@mx.google.com>
X-Google-Original-Message-ID: <20200325171307.GD7983@rohitsarkar5398@gmail.com>
Date:   Wed, 25 Mar 2020 22:43:07 +0530
From:   Rohit Sarkar <rohitsarkar5398@gmail.com>
To:     Hubert CHAUMETTE <hubert.chaumette@kolabnow.com>
Cc:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
        linux-newbie@vger.kernel.org
Subject: Re: Beginner query regarding usbhid
References: <5e7b5fbc.1c69fb81.cace7.7aa1@mx.google.com>
 <1585147543.3831.8.camel@suse.com>
 <5e7b6f15.1c69fb81.d92d3.facb@mx.google.com>
 <b799aa1720fecb94d832264b4561eb8a@kolabnow.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b799aa1720fecb94d832264b4561eb8a@kolabnow.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 25, 2020 at 04:41:38PM +0100, Hubert CHAUMETTE wrote:
> Le 25/03/2020 15:47, Rohit Sarkar a écrit :
> > I was trying to mess around with the driver that drives my mouse. I
> > found out that it is usbhid. I then added a printk statement to the init
> > and exit function of usbhid.
> > I then compiled and installed the usbhid drivers. Post that I ran
> > `sudo modprobe -r usbhid` and `sudo modprobe usbhid` but couldnt observe
> > any logs in dmesg.
> > 
> > I am certain I am missing something fundamental. Could someone help me
> > with this.
> 
> Hi,
> 
> Did you check whether your module was effectively loaded with lsmod?
> What log level did you use in your printk statement? Depending on your
> system default loglevel your logs might not be printed. A quick fix
> would be to use one of the lowest levels (pr_emerg, but pr_err might
> suffice).
> Regards,

Hey,
I did check that module was loaded. And one of the signs was that my
mouse started working after insmod :).

I used printk(KERN_ALERT "some message") for logging. I also tried with
KERN_ERR but no luck. 

The command I used for building was "make -C /home/rohit/LINUX/kernels/staging  M=$(pwd)"
and for installing the modules: "sudo make -C /home/rohit/LINUX/kernels/staging  M=$(pwd) modules_install"
both were executed from the usbhid directory.
from the usbhid directory.
> Hubert Chaumette

Thanks,
Rohit
