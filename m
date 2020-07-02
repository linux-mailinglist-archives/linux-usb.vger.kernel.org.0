Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 216A1212BF2
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 20:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbgGBSMd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 14:12:33 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42]:39366 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726349AbgGBSMd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jul 2020 14:12:33 -0400
Received: by mail-wm1-f42.google.com with SMTP id w3so16920724wmi.4
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2020 11:12:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YRxMoi952bKOnqR45s5vw8t551Wb8zli5IHJK+L3QcM=;
        b=HbeplMw02mWVSSj4KJC5Bi4P9ccVOLvqYVS2oBn+Tbt8fNUiIJEsesngMWjpWqiJNX
         2BaoI0Aq7H6KpIlIZcnmKPSbpWez68hzqZUeCJiApiPI3zYxi0zqHAncb2MEwsFZXxkc
         tUL0TiEDdA2Y3uDSWpGLDtYsPlLwMd15RxVvmVtQ3mW+ShLtlQLNrpygQb9JfsKwp3IW
         BjJpkSTRKidTw3ocgsbDrcRPm6hDrS8bp42UQL2EdNeBziv9a6g1kF/ExssjXA4pf9Wd
         25C0zyZtbvRL/v6BDS1CLF+CLxYZjvOzTaa+UtLsVI5n2ZUND+SFni4YDxDqyXV7DI5j
         KQoQ==
X-Gm-Message-State: AOAM531S3wx/8PSKwBLfZeaXEqpVJlbR4gIQ7TrCjEUNCsY//hVH/OOr
        ug5OB6yQ9wSQ6tMxfT3iBJGKVN5ZfZytiv1R8Ko=
X-Google-Smtp-Source: ABdhPJxpUTT2PEF17BCpILzAd/+k4DxOB+kRdYE5VeoZiKiOR7ZCPaxyBxPnNcA+BLg5fq1Yk2lvoKfvEkP7ygA9WrE=
X-Received: by 2002:a7b:ca43:: with SMTP id m3mr25668792wml.120.1593713551654;
 Thu, 02 Jul 2020 11:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <8f870ba5-5dec-e362-51dd-65311315f6f2@gmail.com>
In-Reply-To: <8f870ba5-5dec-e362-51dd-65311315f6f2@gmail.com>
From:   Felipe Balbi <balbi@kernel.org>
Date:   Thu, 2 Jul 2020 21:12:20 +0300
Message-ID: <CAH8TKc9gaebqZOpv0OFxG-Dq+Tj+FdgJamQ=eP4SMJ-eYBrkOA@mail.gmail.com>
Subject: Re: gadget mass storage with two USB OTG device controller
To:     Benoit <benoit.sansoni@gmail.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Thu, Jul 2, 2020 at 4:08 PM Benoit <benoit.sansoni@gmail.com> wrote:
>
> Hello Felipe,
>
> I contact you because I used the perl script to check out which is the
> maintainer of the gadget drivers.
>
> I am working on a project using NXP imx8 processor which has two USB OTG
> controller.
> Both support device mode.
> I am using kernel release 4.19.35.
>
> I tried to use the g_mass_storage driver using different "file="
> paramter to each of them without success.
>
> I dig into the Documentation folder, but did not find the way to do that.
>
>
> Question:
>
> Is it possible to run at the same time the g_mass_storage driver on two
> different USB OTG device controller?

yes, look at the configfs interface for the gadget framework

-- 
balbi
