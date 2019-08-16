Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAEAF90ACC
	for <lists+linux-usb@lfdr.de>; Sat, 17 Aug 2019 00:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727727AbfHPWS1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Aug 2019 18:18:27 -0400
Received: from mx07-00252a01.pphosted.com ([62.209.51.214]:33240 "EHLO
        mx07-00252a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727669AbfHPWS1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Aug 2019 18:18:27 -0400
Received: from pps.filterd (m0102628.ppops.net [127.0.0.1])
        by mx07-00252a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x7GMIOns017890
        for <linux-usb@vger.kernel.org>; Fri, 16 Aug 2019 23:18:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raspberrypi.org; h=mime-version :
 references : in-reply-to : from : date : message-id : subject : to : cc :
 content-type; s=pp; bh=qKQ41sTUu7xs7+O1Kziqvnfk43yMOerT9/bNdpY1lvo=;
 b=3SLxiKNRGxT+uXhQqMyb5g+LLUhldWIso42F5/QeAYCeFKBGzjwl0nbosyFM2u01epYK
 wb6ZJ1AnWF1GlxDCGiJN/SJcyNejC9f2Zu/na/WTU9CRTtGxLmQJTTOBzP26rX1Y7fUi
 NL2aHiRxfjRrCSrS2HHDux00Lf1v5zgcShCjTvpM7XUznBoycFFrelQKSjYksxywho9c
 ECxKjbp8h2UFHCdI3osLveR1qZc6sEaJe+diIhhNwshjNvtpJWs13+glcJSS2fbSBFEy
 f+hcPLqWETn222OEF50TgfEbT7PpytBVWRgW1KyPXyXR3COmtZ1AIN5ZW0smtwj+FQgX pA== 
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
        by mx07-00252a01.pphosted.com with ESMTP id 2ubfbbsyap-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
        for <linux-usb@vger.kernel.org>; Fri, 16 Aug 2019 23:18:24 +0100
Received: by mail-io1-f70.google.com with SMTP id i6so4761134ioi.3
        for <linux-usb@vger.kernel.org>; Fri, 16 Aug 2019 15:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qKQ41sTUu7xs7+O1Kziqvnfk43yMOerT9/bNdpY1lvo=;
        b=V/Mtxlmq9uwhy2zpMftWDNsu0iZTJrPPX8KNnWYMwzvcCbg9dWA/iCpgDK00bDzjRn
         E1z6HIJfLErY/gkiKcxPAjHjEeggiRf5eOa99m09LJHDYA4+kqr72ztxGnwyXzdkShdI
         kH0c2iBMiCwiU8p+/TjdKUMhqlo9XRLLBcx3S2bt2yaoX+wLHhZVfuGThgMXO5tCe6z5
         jfVc9M5a42uIRUfGTvTl9notnzLsj8IFqTP7++bGlu4Juxjpiye/jyEgLw9odjV8VzIp
         L4jbM+Gjtrtq1F2ELLotkmEuNGB8BEk4FAJPwGxeJwqtU8vG32rvp5uqOnU39fugk705
         r2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qKQ41sTUu7xs7+O1Kziqvnfk43yMOerT9/bNdpY1lvo=;
        b=lM8/2no1Cvjk/kcMytcZ27H7m5pr8swc876wK+smg0f2hWcWRvKnYp3mXaaR1NyGte
         p7QNyoUSEn/xjc2DuThKdoKkRCIGCnfRgNrLo48SqzZd7UKeRN1twpYzjIa45DdjIosM
         9AXP3GrzuQUN64G9xM1RiZdflEJCcHdIWRFgY9PvDXmDo6cb4KTFXOCXjzcwu29iqw/2
         FgJN6nydintqTXkZEIzvovATDqnnOWLLtvKp0wpl0FvSikbtYzI6pgO+NGeROY3+ABzI
         ib6kNASaE1ZCrce6PU+G8GyxNvRyooBAXmn6f6sFcGayOR4yD1pkkd0Frqm9bdQbvcuC
         sEoA==
X-Gm-Message-State: APjAAAWrGV+8xdpwudS3IcCEgAWXT2GPJ43QYgQc4mj5kth0GpKLR15Z
        H6c2WCdyZqJmSPUPc2Ns2MNuuR0qdpukcJoEdcjR7lFD6VOX6dWGKNNWGP/172NZnQ4HRbwT/1e
        zsg3fCr4ND9RSISew2UDk3hHSI2xB4ieSsRx7
X-Received: by 2002:a02:7f15:: with SMTP id r21mr13616248jac.120.1565993897825;
        Fri, 16 Aug 2019 15:18:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwZ2jagFzWX03POGaeGug7goBXEG29RXcwR5V7IlHDhqf/3gT68VJHMHW0J7sNMbYG7YihOVXi3MBdphPJ5ZDs=
X-Received: by 2002:a02:7f15:: with SMTP id r21mr13616226jac.120.1565993897607;
 Fri, 16 Aug 2019 15:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAPHs_J+G0jR5dMg1gVD0z60Zf4oZBikx6P9+B99-TA6m29DWGA@mail.gmail.com>
 <1565866530.5780.4.camel@suse.com> <CAPHs_JLkWmgvWJPyBdugFPfgPMpyeQL1bQe3VLru4BTf9L+iag@mail.gmail.com>
 <1565880737.5780.12.camel@suse.com>
In-Reply-To: <1565880737.5780.12.camel@suse.com>
From:   Jonathan Bell <jonathan@raspberrypi.org>
Date:   Fri, 16 Aug 2019 23:18:07 +0100
Message-ID: <CAPHs_JKF0JPQh2+wzS=cMTOLb+xpBnT=RQh4Xc8EJQu_XyuhPg@mail.gmail.com>
Subject: Re: dwc2 / Raspberry Pi - hardware bug for small transfers results in
 memory corruption
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Minas Harutyunyan <hminas@synopsys.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:5.22.84,1.0.8
 definitions=2019-08-16_10:2019-08-16,2019-08-16 signatures=0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 15, 2019 at 3:52 PM Oliver Neukum <oneukum@suse.com> wrote:
> > The UVC driver passes in offsets into a struct uvc_control as the
> > "buffer" that usb_control_msg() fills.
>
> Not quite that bad. It passes a pointer into the middle of a buffer
> used at different offsets for the transfer. This is technically allowed
> as long as you never touch the buffer while a transfer is ongoing.
>
> That is an accident waiting to happen. Please make a patch using
> a bounce buffer allocated with knalloc() in
> drivers/media/usb/uvc/uvc_ctrl.c:uvc_ctrl_populate_cache() and friends.

A patch to uvcvideo will not fix the underlying bug with the host
controller hardware. There are hundreds of device drivers of varying
vintages that potentially react badly to having a rogue host
controller DMA engine writing more bytes than were reported by the
controller's interrupt status register.

So my original two questions still need answering:
1) Does the symptom seen with v4l2-ctl exist on other platforms using
dwc2 (which implies that this is not a bug specific to Raspberry Pi)
2) How do we harden upstream dwc2 against a broken controller DMA?
