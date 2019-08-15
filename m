Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 262D08EA80
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 13:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730988AbfHOLli (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 07:41:38 -0400
Received: from mx08-00252a01.pphosted.com ([91.207.212.211]:37722 "EHLO
        mx08-00252a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730874AbfHOLlh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Aug 2019 07:41:37 -0400
Received: from pps.filterd (m0102629.ppops.net [127.0.0.1])
        by mx08-00252a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x7FBcUJc026633
        for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2019 12:41:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raspberrypi.org; h=mime-version :
 references : in-reply-to : from : date : message-id : subject : to : cc :
 content-type; s=pp; bh=+Lq/N7f3tvYKWgHHrhuPl7saj7sbCh4IeegT+7rIvaI=;
 b=QR9t9XnzAyJHX+cEp08rQQYazY2OBigGC3WqWqdpY/H44JfA6df/Fr6Uo6R/T0wKr5DA
 0JdAp9cn6aNt7/Y8GpMhlJwk380BI6gfqemlYwaIKfEJi81RAgndyaIlOtXq28Kc4zUX
 iYjL9m+Gn/aXI/ThVguVhoyKcBbHMb0L13HLcQwOScEV2z7o1tcwWMi57f3/USivjNZI
 1UVPErS5hFZh/fYgOI25JxS5gGZBERfJreRR7GOVo5rKRQjXbSdD6ZZQyQLnUhKyGGht
 qZDlUXNAb1YwjZuk4Cp9WahXvjG3IQvHHpJiFhXFrhYccAXFaOyQ48cMBD9j9GfWoElT 8Q== 
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
        by mx08-00252a01.pphosted.com with ESMTP id 2ubfbf99by-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
        for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2019 12:41:35 +0100
Received: by mail-oi1-f200.google.com with SMTP id k4so1034729oif.20
        for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2019 04:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+Lq/N7f3tvYKWgHHrhuPl7saj7sbCh4IeegT+7rIvaI=;
        b=aPF1VHIezdBZNmlnnbIZeNF9AqAOz7k3xUdpDpyOI+/YIZQfLkftItmHpEdeKfVgie
         K6cFa5Qi5auutTbbCSuttLmgn3Zdf3OIN4kd9vgCXQa/yaWsGxLFjxy2LxHyLXAyy9Ot
         kYSk7v0DXDCRWpujfge5E/DbS/2aJ3xf+9As10LT040hyi9fH1rYIZwbgBMeSXNk0DsD
         A8ehvSlT2kdjqgogX0nWpRaON9G875mmqbgYKtVDDLl5luTFIFxsBeagPaxalR5dq5xs
         CMVk/xHIKjwd2grjANgUbyHPHTrl8GKKyPSE40/oMaMuhe+9O5wJJ24bXUjSZl232jDm
         EocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Lq/N7f3tvYKWgHHrhuPl7saj7sbCh4IeegT+7rIvaI=;
        b=hy+y6RxGJnPg0HahDZYDtlrWXpjx21ZIo6qFc8hmFwDMAzGmDug7NVFvcDCEmj/wda
         trSOrQxCD4sz/vx+SxmGTHpe/QzGqWjAGMOe/EW8ODyPB0XObcF8Fw1yQWauhWhQ8/iy
         hwlIgzRF9zWeWYl4PR1Nk0eVTRGOXv053vUt+yGX+eASg2Hqj8Wo2emHS4Du2JIoBkqR
         9NGrrrIVTR8jQvyqRazwMNbAQdrZa/E6Xo8vwrcmyUht4f+iufvGHFY2eoNdxc2WEVPb
         djGnSCKSGcoTCtYIYHjFhuuoyLw72Kkxo05nDUBOFd6PMp3UTRT/NRKmhR/G4dlEF63J
         PztA==
X-Gm-Message-State: APjAAAV1Lv67i2FWXEQjurOVz//C5V3QW+wjWVGo0fk9z+DRRvOzF0gm
        CAQMq9wYm8MX4ELTc+wNptvjn/XZu2+pqKUmQwES9t2o3xhGNgZIsynzCul6zlcCZtTkihAP5J7
        98XzHr7gvJ5lHNeVOR9N/KEvAlDk5CpkEXwnR
X-Received: by 2002:a6b:b886:: with SMTP id i128mr4843086iof.90.1565869293388;
        Thu, 15 Aug 2019 04:41:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzJksW2HGzVerRzGm5cIXM40SniDcNWZZjj0Js5+5FPo7iqjdW7V7WmAVYuo05q1pFlxeG7CPsHHqGhhim87Vo=
X-Received: by 2002:a6b:b886:: with SMTP id i128mr4843075iof.90.1565869293201;
 Thu, 15 Aug 2019 04:41:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAPHs_J+G0jR5dMg1gVD0z60Zf4oZBikx6P9+B99-TA6m29DWGA@mail.gmail.com>
 <1565866530.5780.4.camel@suse.com>
In-Reply-To: <1565866530.5780.4.camel@suse.com>
From:   Jonathan Bell <jonathan@raspberrypi.org>
Date:   Thu, 15 Aug 2019 12:41:19 +0100
Message-ID: <CAPHs_JLkWmgvWJPyBdugFPfgPMpyeQL1bQe3VLru4BTf9L+iag@mail.gmail.com>
Subject: Re: dwc2 / Raspberry Pi - hardware bug for small transfers results in
 memory corruption
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org, Minas Harutyunyan <hminas@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:5.22.84,1.0.8
 definitions=2019-08-15_04:2019-08-14,2019-08-15 signatures=0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 15, 2019 at 11:55 AM Oliver Neukum <oneukum@suse.com> wrote:
>
> Am Mittwoch, den 14.08.2019, 16:59 +0100 schrieb Jonathan Bell:
> > As reported by one of our users here:
> > https://github.com/raspberrypi/linux/issues/3148
> >
> > There is a bug when the dwc2 core receives USB data packets that are
> > between 1 and 4 bytes in length - 4 bytes are always written to memory
> > where the non-packet bytes are garbage.
>
> Hi,
>
> in which function does that happen? If your buffer cannot handle 4
> bytes I cannot see how it copes with teh DMA rules.
>
In drivers/media/usb/uvc/uvc_ctrl.c:uvc_ctrl_populate_cache() and friends.

The UVC driver passes in offsets into a struct uvc_control as the
"buffer" that usb_control_msg() fills.
