Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA6239AE6A
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jun 2021 00:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbhFCW6X (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Jun 2021 18:58:23 -0400
Received: from mail.palosanto.com ([181.39.87.190]:53494 "EHLO palosanto.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229629AbhFCW6X (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Jun 2021 18:58:23 -0400
Received: from localhost (mail.palosanto.com [127.0.0.1])
        by palosanto.com (Postfix) with ESMTP id AF91213C2A3A;
        Thu,  3 Jun 2021 17:56:33 -0500 (-05)
X-Virus-Scanned: Debian amavisd-new at mail.palosanto.com
Received: from palosanto.com ([127.0.0.1])
        by localhost (mail.palosanto.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id PA_z-EyEFDjS; Thu,  3 Jun 2021 17:56:31 -0500 (-05)
Received: from [192.168.0.105] (unknown [191.99.2.15])
        by palosanto.com (Postfix) with ESMTPSA id 1D58F13C2A35;
        Thu,  3 Jun 2021 17:56:31 -0500 (-05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=palosanto.com;
        s=mail; t=1622760991;
        bh=nGtW/Tt3yP/o8nC+wkXFwWHDIhTbwypjXDGzQ0Jw9RA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=sYB4LyAyzA3C2Ca6tW4sEykwEWJiH54UB6GsGidfR6hZ6z1D5KVBuvfxcr5nFpaYm
         PCNSJEtPcLahctq5gyekAvY4699vIqgbtNhEy//X3cWoehplcN65jGeSdB/gGSrGXo
         ohYQ89/lQGR5ofmEsTZoulkl5HYAjfMJtF20u6XU=
Subject: Re: CP210X: Failure while programming ESP32 dev board
To:     David Frey <dpfrey@gmail.com>, Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
References: <CAAvkfd_vPHcd5CTLrA_BoVhg_aNWNzcp45yO-dCpJZhyabjjsg@mail.gmail.com>
 <YK4T+w+e8TtAUuEo@hovoldconsulting.com>
 <CAAvkfd91qr+aQQxXyQfk1e2Avifcdp6fCwgrk3c7=ex3pcqvPw@mail.gmail.com>
From:   =?UTF-8?Q?Alex_Villac=c3=ads_Lasso?= <a_villacis@palosanto.com>
Message-ID: <6a6d0902-02ea-b144-6275-a44ed4b756ee@palosanto.com>
Date:   Thu, 3 Jun 2021 17:56:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAAvkfd91qr+aQQxXyQfk1e2Avifcdp6fCwgrk3c7=ex3pcqvPw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

El 3/6/21 a las 16:48, David Frey escribió:
> Hi Johan,
>
> I have added linux-usb@vger.kernel.org to the CC as requested.

> It appears that in the 5.12.8 kernel, there is a failure every time
> cp210x_tiocmset_port is called resulting from this:
> ret = cp210x_write_u16_reg(port, CP210X_SET_MHS, control);

Sorry to butt in, but if you are comfortable compiling kernel code, try 
manually reverting only commit f61309d9c96a308465bec9d2e5206da265b075a0 
(USB: serial: cp210x: set IXOFF thresholds) and loading the resulting 
.ko module. I do that to keep working in my ESP32 projects while this 
issue gets a proper fix. More details at bug report at 
https://bugzilla.redhat.com/show_bug.cgi?id=1965527

Just a guess: maybe ulXonLimit and ulXoffLimit should only be non-zero 
when actually enabling software flow control, and must be set to zero 
otherwise? The faulty commit just assigns them unconditionally to 128.
