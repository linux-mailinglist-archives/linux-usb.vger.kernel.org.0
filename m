Return-Path: <linux-usb+bounces-11351-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A5E90A08E
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 00:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28C231C20C97
	for <lists+linux-usb@lfdr.de>; Sun, 16 Jun 2024 22:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D9C7175B;
	Sun, 16 Jun 2024 22:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mivz9eCm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995F114292
	for <linux-usb@vger.kernel.org>; Sun, 16 Jun 2024 22:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718577791; cv=none; b=W1sWgQcAgLxAu3edQQ/AmhUliKcckxNrvPYEBlJFPgRtn10LchRVUzuu6sK81yPch2tYKYikt8dWqdlwKKgIIpHrgu6Y6+8S0FeRSMakw9yViRB53W/elDlpH7ngBJ3qZXBXAaTEjMWGfPH7AB/MpRwVplfGjq4MVMBHvnewmWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718577791; c=relaxed/simple;
	bh=UqpkcAxzoxyR5VWpQeztSaGsqHGU8xJ+jSDKkVg2cgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qAJ+1/MUCH5vbR/2z9dHQt8q4IkMYB12T6drjIZDsNn2Cv9cQ+BsRHgWV1WPu87Q5gqu/YLYtArPE1fM+MYctE0GwPnuO0x+lofgrRixaYMwvZ9vwY9ssXO96A6H4y+An/rlTtCqQXVYX2hskDUopzlbKddVi/PwqNMu4gNizS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mivz9eCm; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52c94cf4c9bso4579327e87.2
        for <linux-usb@vger.kernel.org>; Sun, 16 Jun 2024 15:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718577788; x=1719182588; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOYpgkSiICclUMNh38z4SmmpBQOehg/7r0Pw6r/KuHg=;
        b=mivz9eCmb6mC9AjCgpSgUCkcztyF3l1WI27fBQ8YhPwFEGUpG3CfmuR5avLnUd6Bsm
         LfRtYCl3iodiyKL02y2gxlr9jJoj1+4KZiucvLX5W7j7+tJ9YKGCMk2x3GcWwS4u4ddp
         2XHG9EPNXQmpwkaIhG4BiWy5BRrV16IEntov4GwhN4VWNOkS/BI1SiXUsMO3VBZufFNd
         F66VUFJii47SSLkKN/YIY8g3ezL1fMVq7eUUC2qO8oKHeB7A3Z3VDoSdfTCVWepFRTMr
         CYhXgOl9ZR2GZtcelP5/WjRhfBV8MSHn1IJs9G57yNhFb8HjetqhSC/cn2loywL/tGqC
         YYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718577788; x=1719182588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KOYpgkSiICclUMNh38z4SmmpBQOehg/7r0Pw6r/KuHg=;
        b=eipnFnmfVr6WktdIMXfRWPOeaW8pwVaxiNoyVuttJp46IDT+7vOnt7ZkwJim/XJSgk
         e4zaRxS/uc75KNd6AXpX6eiWkdt4tLmNMSD5TUpd0jAjG3svUYUZehnfvm2j4ZBYNLnL
         ZLYe/cgrLpvYTr7BNXiYEmuaPUAz2sE6rx+WrEURInzLTZyfMD03YsXEgqkscbQuWtZ1
         3XvTCjEJwnAKAddUI4xFHXTTcT1e/jyTyCsdwNIfO23Uo6L4liseuAe8SApnc+xtW6hr
         ad0o9enaJ32RT037eJqszCbNgSjBQ11DrmAqxjsv2FfSDLpk3sHFpOsEFRmzAdqKbOqt
         Tj4w==
X-Gm-Message-State: AOJu0YzmxLNEL9BN1ZX1OUBaGiRxSGS52payF5G6CuV3P3BcHlP01q89
	BguDMSXtlAATuc5jVCr6fAKNsj9prGOJAxW1biXY1olW8at9FrL579e0L0tUSrtEMUTUdYOJy/h
	ZZN1h2CUGSTkqExqTgDQNky/6KYHu5zsR
X-Google-Smtp-Source: AGHT+IHViDBrjNipzXktxG8vugfb6oCfwbyWdFPMAfR9ADWBoTjGonmZTL7YGWNx4f8+G+1vdbYMrzf7cTQRBAWWBXE=
X-Received: by 2002:a19:f60d:0:b0:52c:82bd:bc6f with SMTP id
 2adb3069b0e04-52ca6e563ebmr5417112e87.11.1718577787357; Sun, 16 Jun 2024
 15:43:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+fCnZeLRqk-FOkJ81qMY0NMZC7YnW=beTw=w_DVA=OhOnywRw@mail.gmail.com>
 <8b7aa23c-9976-46c2-b64f-1d4614aefe89@rowland.harvard.edu>
 <CA+fCnZd1UOqCiH7L1FMMqLhepiMSBfgVb-tXfc81F_VuX_zy4w@mail.gmail.com> <73838855-fe52-4d2f-a826-c5757f75bd92@rowland.harvard.edu>
In-Reply-To: <73838855-fe52-4d2f-a826-c5757f75bd92@rowland.harvard.edu>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Mon, 17 Jun 2024 00:42:56 +0200
Message-ID: <CA+fCnZetfWWhO+Fufg_Q=MOFtyN+g6nBrLJ29HGrGc0znsQTGQ@mail.gmail.com>
Subject: Re: Stalling non-0-length OUT control requests in Raw Gadget/GadgetFS
To: Alan Stern <stern@rowland.harvard.edu>
Cc: USB list <linux-usb@vger.kernel.org>, Paul Elder <paul.elder@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 16, 2024 at 4:33=E2=80=AFAM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> > This series below is the one you're referring to, right?
> >
> > https://lore.kernel.org/linux-kernel/20190124030228.19840-1-paul.elder@=
ideasonboard.com/
>
> Yes, that's it.  I'm impressed that you were able to find it; I had lost
> track of it.

Luckily, it was one of the first google results on the topic :)

> > Do you know why it wasn't merged? (CC Paul). There are no comments on
> > the latest version I managed to find.
>
> I guess Felipe Balbi (the USB Gadget maintainer at the time) just wasn't
> very interested in fixing the problem.

Ok, I see.

> > Also, just to check my understanding: with that series in place and
> > assuming the UDC drivers are updated, a gadget driver would need to
> > first do usb_ep_queue with the proper length and explicit_status =3D=3D
> > true to get the data for the control OUT request, and then either do
> > usb_ep_queue again with length 0 to ack or do usb_ep_set_halt to
> > stall?
>
> Yes, that's how it worked.  Alternatively, if the gadget driver didn't
> set explicit_status in the control-OUT request then the UDC core would
> automatically call usb_ep_queue again with a 0-length transfer to send
> the status.  That way existing gadget drivers would continue to work
> after the UDC drivers were updated, and updated UDC drivers wouldn't
> have to worry about doing an automatic acknowledge only some of the
> time.
>
> Note that in order to avoid breaking things during the transition
> period, it would also be necessary to add a flag to the usb_gadget
> structure, indicating that the UDC driver has been updated to support
> explicit_status.

Ack, thank you for explaining!

I've been collecting different kinds of non-critical issues and
inconsistencies within the Gadget subsystem I hit while testing Raw
Gadget. It's unlikely I'll get to working on them in the foreseeable
future, but it's good to know what needs fixing should the need arise.

So far, I have:

- Allow stalling non-0-length control OUT transfers
(https://github.com/xairy/raw-gadget/issues/71);
- Contain USB_GADGET_DELAYED_STATUS within composite framework
(https://github.com/xairy/raw-gadget/issues/70);
- Support isochronous transfers in Dummy HCD/UDC
(https://github.com/xairy/raw-gadget/issues/72);
- Fix dwc2 issuing disconnect instead of reset
(https://github.com/xairy/raw-gadget/issues/48);
- dwc3 doesn't support low speed, even through a comment says every
UDC must (https://github.com/xairy/raw-gadget/issues/41#issuecomment-178302=
2764).

> PS: There's another weakness in the Gadget API which you might possibly
> run across in your project.  It's less likely to arise because it
> involves lengthy delays.
>
> Say there's a control transfer with delayed status, and the gadget
> driver delays for so long that the host times out the transfer.  Then
> the host starts a new control transfer before the gadget driver queues
> its status reply.  Since the Gadget API doesn't have any way to indicate
> which control transfer a usb_request was meant for, the reply that was
> meant for the old transfer would get sent to the host, and the host
> would think it was a reply to the new transfer.
>
> This problem could be solved by adding a unique ID tag to each
> usb_request, and passing the transfer ID as an extra argument to the
> gadget driver's setup() callback.  That would explicitly indicate which
> transfer a request was meant for.  But doing this would also require
> updating every function driver and every UDC driver.  Probably not worth
> the effort, considering how unlikely it is that the situation will ever
> arise.

Ah, good to know! My experience confirms that this is unlikely: I
haven't hit this issue in practice yet.

P.S. By the way, I've been lately using the dwc3-based UDC built into
one of my ThinkPad laptops for testing gadget drivers. I had to switch
a hidden BIOS option to enable it (which was not straightforward), but
it's nice to avoid dealing with external boards. I've written an
article about this, in case you're interested:
https://xairy.io/articles/thinkpad-xdci.

Thank you!

