Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A49B8EC06
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 14:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731027AbfHOMzJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 08:55:09 -0400
Received: from mx07-00252a01.pphosted.com ([62.209.51.214]:11944 "EHLO
        mx07-00252a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729918AbfHOMzJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Aug 2019 08:55:09 -0400
Received: from pps.filterd (m0102628.ppops.net [127.0.0.1])
        by mx07-00252a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x7FCsZNf002301
        for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2019 13:55:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raspberrypi.org; h=mime-version :
 references : in-reply-to : from : date : message-id : subject : to : cc :
 content-type; s=pp; bh=gbN2amsLMfVwAula5SUBsvIFJlbpbU/3PCRkaEjwK4Q=;
 b=lFm4SqoqyPyuAyUsE23MALL+nrCi8KWelEoEeNIq73X7m30O8PpWy0dO2FvVeTnkNzdW
 U+lRwWIGXNSiEFPimClALU3IZWGNhP1U1jQTj+/djqFNE2wvmxn3nUjDCa94fljWqgbI
 WVt/l/l9mtrv3jqeQibDE8SKhhytYrsbS1q8UpIIlDNwzpfkp9FeobfKCKjo1KF1TOJz
 j7A5vNFsbCLE8/Yp2qwDqdagchVtNvjOUDhkO4/Aap4abk0QKPjNRSDdOhknDsfegDoD
 opVopzC5/WWvUX+yxSbQL5/KfKIMickldvnJvZd9bfVPUrmAbdbEbAVILv3TIDh8Y4pD /w== 
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
        by mx07-00252a01.pphosted.com with ESMTP id 2ubfbbsas6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
        for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2019 13:55:06 +0100
Received: by mail-oi1-f197.google.com with SMTP id t22so1192385oij.17
        for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2019 05:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gbN2amsLMfVwAula5SUBsvIFJlbpbU/3PCRkaEjwK4Q=;
        b=Cw87sPbR9y/x0+8lJnPWUkw/v1YfXucrtAmTsdxWhKxtk8NdQB73tklCoHky24C/ZM
         EUBhMOula5ACsD88tIQ+EZsZzKgg1GsmpLVICbEDeizBhhSYdAZFT5IJk3xnGl5b4PZc
         hn6O3vCOWNfT2Ow2C0WfCKzeAm5b9xgnfDXxlk+5+avIYgoW6HZHWKiYztgS+z0u06sy
         aDnJZEFEfvLlJGICYl0rzbsWBawr6HrYYHlFwxvw/ziMs8rZwrnYmvk9hZDBf05i3RhS
         X4jiXb74rdIaWDTzQzCRL4lUHprnMU774vTb2/PvSqR6Q+B4JNfeYnCKNSlEHkSlkewn
         H7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gbN2amsLMfVwAula5SUBsvIFJlbpbU/3PCRkaEjwK4Q=;
        b=X2WnityftkYXX3s/Jc/3kI9LXeObNCCr7p3dLc6I9n4YBivzUPwqDEE8Ji97xjIJ0H
         P0SQoLHGARYFaDDPM7ws/j0lcNgTnRDzi+jnkGnhbZrfDzl8qkiGSSVveRfl9p7v0XXz
         7hxrWRapK5SLm6xa6ylUz0QpbntU+UEHUxrPolO7d4EI5WDTAnAcq19Fskdr2RcY0VFv
         AIwTgqkB9bnsxiCHDGohbsnrCZK+mABB3Wq9HENkr71FcCHZb70Gh2lX6KKvLOq3rVi+
         wywb/7xDoy8nbvFRvfzwWSmOBmQc6HAPyGJL46dkODabYgsHBpxcxEBNnpYvex2Dlowm
         oPTg==
X-Gm-Message-State: APjAAAVsZjgz2lCSoZCddpd5JXV3sLrQ+ZwFe++iHws9Dydle73LUhi6
        f1bQM5buwfYtnxEsB/ArAvYw5YVuRXDmuMaojjefOr7fc64eKo4Uaj/j4Q4qjgWTldETvoInKm1
        tgQP6odBVXQHreOfiGHJ/ET5EQg/Hu1B/FN0L
X-Received: by 2002:a6b:ea02:: with SMTP id m2mr500213ioc.155.1565873704296;
        Thu, 15 Aug 2019 05:55:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzmDTjS9byiRnG+C5Kn+U6mZU+WUIJlDZLJTtgUGS1HOpadqSdAhatshuIzlSzjFOyHtRKvpmCz/4MDvqt2aog=
X-Received: by 2002:a6b:ea02:: with SMTP id m2mr500205ioc.155.1565873704120;
 Thu, 15 Aug 2019 05:55:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAPHs_J+G0jR5dMg1gVD0z60Zf4oZBikx6P9+B99-TA6m29DWGA@mail.gmail.com>
 <0f259f36-4737-8a23-d39f-3a3b054aa753@gmail.com>
In-Reply-To: <0f259f36-4737-8a23-d39f-3a3b054aa753@gmail.com>
From:   Jonathan Bell <jonathan@raspberrypi.org>
Date:   Thu, 15 Aug 2019 13:54:50 +0100
Message-ID: <CAPHs_JK-XrTij4stQELuypAjohr+5Kg4MW=fhOJk5t_r12j0cA@mail.gmail.com>
Subject: Re: dwc2 / Raspberry Pi - hardware bug for small transfers results in
 memory corruption
To:     Lars Melin <larsm17@gmail.com>
Cc:     linux-usb@vger.kernel.org, Minas Harutyunyan <hminas@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:5.22.84,1.0.8
 definitions=2019-08-15_05:2019-08-14,2019-08-15 signatures=0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 15, 2019 at 1:51 PM Lars Melin <larsm17@gmail.com> wrote:
>
> On 8/14/2019 22:59, Jonathan Bell wrote:
> > There is a bug when the dwc2 core receives USB data packets that are
> > between 1 and 4 bytes in length - 4 bytes are always written to memory
> > where the non-packet bytes are garbage.
>
> Which host controller driver, dwc2 or the out-of-tree dwc_otg driver?
>
> Thanks
> Lars

The bug was present when using either the out-of-tree dwc_otg or
upstream dwc2 driver on Raspberry Pi.
