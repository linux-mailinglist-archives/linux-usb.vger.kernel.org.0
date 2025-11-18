Return-Path: <linux-usb+bounces-30650-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5A8C67AE9
	for <lists+linux-usb@lfdr.de>; Tue, 18 Nov 2025 07:21:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 542444ED91A
	for <lists+linux-usb@lfdr.de>; Tue, 18 Nov 2025 06:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA632E5D17;
	Tue, 18 Nov 2025 06:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CN9Ne1sb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B1A2E36F8
	for <linux-usb@vger.kernel.org>; Tue, 18 Nov 2025 06:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763446878; cv=none; b=PGz/MtOb6GcVRPOZSVp1x86aNrjZ1qIVbtIooTUVgnRYEWH6GhRo2PURdknuvw7UNtCR87Fzs7VAtbdR5Wyqtb8HVUXNxydA5Q9EIUPhFZ/l5i54ITq6xGc8igYJIwJhoQ/+d8kXWm10XjMnxnvr5y//0wTGbtDvUyFHQa4mNWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763446878; c=relaxed/simple;
	bh=tI9jrttFMazrhVobC3V5rHm7G40u2hp8XylQEMfCIVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IhDoIXOI3Vp3h5z0dgvI4MiFEQ0YKaVE9ds5SQu/jfZO8YOGn/8/13mLWJC4EloqhtQbaSzplvzb83c2NfKcR5kVYJVBlWE2IMjEJ5MJmg2pyOnNJ9yqIJHzblfeWDV23QhsS/Yprt76BJYdsnVyUwf6RFYveH6HPoFFy2ZULjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CN9Ne1sb; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59577c4c7c1so5713571e87.1
        for <linux-usb@vger.kernel.org>; Mon, 17 Nov 2025 22:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763446874; x=1764051674; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ysdjL08gT04Qik9gf3HpBRhQ7k22nSIylee/eFBrkkk=;
        b=CN9Ne1sbjAu0SMSogMTo5BHnjS4Wa0KG61aty1CG/ONk7i2TGXhI7F7xo6cK5yradL
         V6dl9wt/+7rMuqoiCi1MYtIgIi26GKqTA+KmGH/LQeT54ioZuB6NRZK4UEqv008VNkEn
         0MBweIC1g6kxt9luNXwegftL+jKH0ZRXpBNkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763446874; x=1764051674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysdjL08gT04Qik9gf3HpBRhQ7k22nSIylee/eFBrkkk=;
        b=ADsyd88QlLbYWSqrEiTEIrxBZXa9LJZ9C5JP3SVv5+g7bOxjeDlpO7amQtp00Bjgri
         Xq02eP9QirAwTKGLti++nhAw18151VMoAQnHYpZnpXNGHW2JJsJkHNU0YyrfT5JXx8GR
         jx5wJBkxzRoq+9mw240PZvR0YaIRKp2je07Nue/cF5oKBsWlSautKg+W2aWNXKcACXGO
         jsHYK09ndiBlXvzScVDl5023QoX3cN0M2o76SWzyZ7kSWgnBtmuKVuPGgX6LH+tF1EKv
         MvB2OhIdQQ7gL3u3eZui+Zp1t93WisFtLIf9EmWLUKIMFMrClMHfB1M00d4jZZMdq7DB
         SlBA==
X-Forwarded-Encrypted: i=1; AJvYcCUN/ycJg8LcjjfgLD0fGHVkYrPCX+S1Bp40FPtniQlZ8KMDKYbtmDb1rTX7hPsYKcwQVUCJAACVLLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMiszEsomw/JLnzm8f1DSObRukC2AcpXM117urGnIDh7/i6+p6
	AOWf2HxpCGuqyjN+1yp8tH6nm+lBIsGHcKnifcpDrmdT1XSkcwxdHMV/9eh9aXRKQzyRFrLGEeC
	v6BpVWQ==
X-Gm-Gg: ASbGncu/p1UUXTkK7c24oyViOsoN4bfVXimltsdhopCfCh9YW9MV9acevgHa3WMBsK3
	0f7U2TEjiVQs6EfDYMb7HmxGHGvua6bk/r91uh//21qBFRQtdliXLcMOvgELa5Yo7YiTuKXaGjV
	MgTnNXlO6dlQPagxlIVDhA7ROgtOhzmrfsPLIVbWfDX7ZUOg/3KsKybf7O9dwGc+wcdrqnOHf8l
	XjWpt/xc9eb0ZJzgKoIwGpsgWv8MsJ2IYSg6Nsbl5sAYqn+tBYEuSv14I7AMmRRDcjhWGLUPgss
	E+4Oo5iFAHXh9DC2D6L+noWcAGBrBsgYbN63RoMw6cUi9OA5MujyLaxmyPAIgaWNYxGOD32n7NM
	Qa7BXwFxJ1D1OjaJvwXxCsZsyHEuQCL1x5nEF8735VimJaniFQ3jrmz5SG1dgFB1epowvyW7+Zs
	1lDKuICPs2+CC+MClPDtswVc1sF6Zh51BP0Bf1/1pI7B9m/DwA
X-Google-Smtp-Source: AGHT+IGcge4eG+WO7XUjRcrFu4AijftkFZJaIyiXtr+TBa9MAlqDR+fTQzAv84ZY1uv+b28Ew+aDXw==
X-Received: by 2002:a05:6512:800b:10b0:595:997e:19ad with SMTP id 2adb3069b0e04-595997e1a79mr317759e87.21.1763446874237;
        Mon, 17 Nov 2025 22:21:14 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803ac925sm3696747e87.10.2025.11.17.22.21.13
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 22:21:13 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59583505988so5605310e87.1
        for <linux-usb@vger.kernel.org>; Mon, 17 Nov 2025 22:21:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUAGijlQaH1Y5N0bpOgLCVl8Q5pVMiTrwGJ9oVla1SOspiHs14dnXu6/o6+XUM0vhEAIPZstXRxQss=@vger.kernel.org
X-Received: by 2002:a05:6512:800b:10b0:595:997e:19ad with SMTP id
 2adb3069b0e04-595997e1a79mr317744e87.21.1763446873332; Mon, 17 Nov 2025
 22:21:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
 <20251117-uvcdynctrl-v1-4-aed70eadf3d8@chromium.org> <f922a8271624a6ae765abbf9894867007a29c8e7.camel@irl.hu>
In-Reply-To: <f922a8271624a6ae765abbf9894867007a29c8e7.camel@irl.hu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 18 Nov 2025 07:21:01 +0100
X-Gmail-Original-Message-ID: <CANiDSCs7mdMmCxho+u=DC53kCaUTq05htzpV2=_NEkvq0U0pOw@mail.gmail.com>
X-Gm-Features: AWmQ_blnmSAN7Cb6DNpvxZ2bsrbBZvCeN_Yn5xmI56Ol3gaqxpLu_duN8wDLPAw
Message-ID: <CANiDSCs7mdMmCxho+u=DC53kCaUTq05htzpV2=_NEkvq0U0pOw@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: uvcvideo: Introduce allow_privacy_override
To: Gergo Koteles <soyer@irl.hu>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Nov 2025 at 22:10, Gergo Koteles <soyer@irl.hu> wrote:
>
> Hi Ricardo,

Hi Gergo

>
> On Mon, 2025-11-17 at 20:14 +0000, Ricardo Ribalda wrote:
> > +     if (uvc_is_privacy_mapping(xmap) && !uvc_allow_privacy_override_param) {
> > +             pr_warn_once("uvcvideo: Privacy related controls can only be mapped if param allow_privacy_override is true\n");
> > +             return -EINVAL;
> > +     }
> > +
>
> To really prevent the LED from being turned off, it should also be
> added to uvc_xu_ctrl_query.

Will add in in v2. Thanks.

I wanted to get the ball rolling first :)

>
> But why has it become so important after 10+ years that it cannot be
> turned off on Linux? What has changed?
> The majority of users use open-source software, they can view the
> source at any time.

Most users expect that the led is always on when the camera is active.
I think the usecases where the led should not be turned on are spooky
or very limited.

Even if you use open-source software, when it parses user generated
data, there is a risk for bugs. If there is a bug the only thing
protecting the security of the camera is the membership of the video
group which is a very low barrier. And once you manage to change the
LED behaviour will persist in other unrelated apps.

With the current proposal you need to actively enable the
privacy_override_param, which typically requires root access.

Regards!


>
>
> Gergo



-- 
Ricardo Ribalda

