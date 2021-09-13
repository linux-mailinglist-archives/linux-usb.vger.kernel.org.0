Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7260C408A81
	for <lists+linux-usb@lfdr.de>; Mon, 13 Sep 2021 13:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239698AbhIMLvq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Sep 2021 07:51:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35885 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239186AbhIMLvp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Sep 2021 07:51:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631533829;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1hHEoDHq70Y8LZ9UwHpfMsPaoDNaiVP1tazOGJebc6Y=;
        b=H0mYZRkaCc5PprjGLeLdFGP66GMqtPAAu72Ptw2n8MziFBNJIJp55ZFT6d86X+ujZfQESD
        S/TFbXZ4HE4YIDPqiGjXKi95X0slrAMzGGMxFB2WzDusAVy9ksPSiq0rW3dMF7diMSpMpd
        kQ9Cy6hbE3wjTto4Vhf/VZEUe/vuljM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-XaP1bgB6P4y6XvH2WlSLrA-1; Mon, 13 Sep 2021 07:50:28 -0400
X-MC-Unique: XaP1bgB6P4y6XvH2WlSLrA-1
Received: by mail-ed1-f71.google.com with SMTP id z17-20020a05640240d100b003cac681f4f4so4769381edb.21
        for <linux-usb@vger.kernel.org>; Mon, 13 Sep 2021 04:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1hHEoDHq70Y8LZ9UwHpfMsPaoDNaiVP1tazOGJebc6Y=;
        b=123gNnlVT0ENOV+9goLMIbvuKUDK231/7k9/TOJbL5GX9b5ViFc5ijcGnAtYqyWBuW
         q1AJe9S3pT1Bgdo/CavNP6wzK3RkvFuoKvTGFfs+OFliDlcRTLEX8rHSgapeN8R0S7jE
         xMNatyns7hEfEe1VCGeT9UDI8KawM8W2nedkzy9s7GAXE2ZRoqwA6DrlyNaSHGCdnNIK
         8oyn3xXrL24xUGsZJrc0RrP1DrMqYQrNBHe3frivC+5eGKvHl1fDe6PUrVgXzinhOWxw
         TEAQvX5uH/G258ly7IrqjjMiNsRF9GhRc65E48bSMURsm/PupQB1uZ870qH37vQzsA4l
         EQNA==
X-Gm-Message-State: AOAM533YebAGHc3CWqNvTE8KjntlEUHk8f1AaZVXwBoIP8GW8mI0+9vk
        Ood9/BHjuSBiBRWfSrCgZEQVtRFjAAmqvBleIlKh/eokVcKAVdWOJNtcM5Fu/XG1YPqRIose7t+
        z1dHraS9MtTdvgGU9MxnS2ldFEoVQ6fRuOA+hamGdrdSTbgvNshO8B8zVQvD0p6Lqz75sT8Ck
X-Received: by 2002:a50:eacc:: with SMTP id u12mr12715970edp.140.1631533826932;
        Mon, 13 Sep 2021 04:50:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoVUTvAg4hxlZQ0vdoI1FDH0I9nEyrFSN8XJc/ZMPtGARxcusRePtQhMU6OsNMYKwfXuW6sg==
X-Received: by 2002:a50:eacc:: with SMTP id u12mr12715961edp.140.1631533826776;
        Mon, 13 Sep 2021 04:50:26 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id kx17sm3354791ejc.51.2021.09.13.04.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 04:50:26 -0700 (PDT)
Subject: Re: Lacie Rugged USB3-FW does not work with UAS
To:     Oliver Neukum <oneukum@suse.com>,
        Julian Sikorski <belegdol@gmail.com>
Cc:     Nathan Stratton Treadway <vgerlists@nathanst.com>,
        USB list <linux-usb@vger.kernel.org>
References: <ffe7a644-bd56-3f3e-4673-f69f21f4132b@gmail.com>
 <1566595393.8347.56.camel@suse.com>
 <5f8f8e05-a29b-d868-b354-75ac48d40133@gmail.com>
 <a090c289-6b1a-8907-271a-069aea96ba2f@gmail.com>
 <1567424535.2469.11.camel@suse.com>
 <2a06a5dd-3fc9-0aac-a7e2-67be35e2d6bb@gmail.com>
 <20190904155831.GE4337@nathanst.com>
 <d11b22f3-3f09-2e3f-dc64-956193f2c5d3@gmail.com>
 <1568033125.365.17.camel@suse.com>
 <ed7f6cd6-b787-4876-2462-7977d69c8d4b@gmail.com>
 <f4682d70-9623-c877-78a1-2cdf471014f6@gmail.com>
 <4c2b1c8a-4126-ccfe-3431-323c4935566e@suse.com>
 <56cebf15-cf9d-475f-b388-b2be723697f6@gmail.com>
 <c4d769e6-b906-f5f4-255b-7faf27f8702f@redhat.com>
 <CA+xVL_QEgzb1tu-tzqYPxJF-G_a8czCp=uyZ1JJ9+5xmCcNp2Q@mail.gmail.com>
 <CA+xVL_QrJ9f8-BwVRq1oG_yo2Cd=yQH9=TCm5g=MUO9MmdvRVA@mail.gmail.com>
 <830f09f8-7e16-425e-d5dc-2c5102ee4c7a@redhat.com>
 <25e6ce5a-4732-8ffa-4805-9bf95859214b@gmail.com>
 <87a80ce7-7f66-627a-20ad-791cb971ffaf@redhat.com>
 <1f6c3026-143a-2004-24da-1da56e6305be@suse.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2167ea48-e273-a336-a4e0-10a4e883e75e@redhat.com>
Date:   Mon, 13 Sep 2021 13:50:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1f6c3026-143a-2004-24da-1da56e6305be@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 9/13/21 1:06 PM, Oliver Neukum wrote:
> 
> On 13.09.21 09:38, Hans de Goede wrote:
>>> Hi,
>>>
>>> I have just updated my backups with f+k quirks enabled and everything worked without errors. Given that nobody appears to be aware of a sure test case for checking whether f alone is sufficient, should I just generate a patch enabling fk instead of u?
>> Yes I believe that switching from fk to u, like done on the other Lacie entries is best.
> 
> Hi,
> 
> just to be sure that we are really on the same page.
> 
> Do you really want to go to u - US_FL_IGNORE_UAS? The other one
> has fk - US_FL_NO_REPORT_OPCODES | US_FL_NO_SAME

We currently have u - US_FL_IGNORE_UAS, because Julian's initial patch
did that and that was merged.

What we are talking about now, is moving from the big-hammer 'u'
to fk - US_FL_NO_REPORT_OPCODES | US_FL_NO_SAME, since testing
has show that just 'fk' is enough, allowing us to keep using uas. 
> I may be a bit confused and I think we need to make sure first, that we are
> talking about the same things.

I hope that my reply above helps to clear things up.

Regards,

Hans

