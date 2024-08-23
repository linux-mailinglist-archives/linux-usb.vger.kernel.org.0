Return-Path: <linux-usb+bounces-13951-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F4395C9DD
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 12:06:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A5281C2124A
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 10:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3BC71607AA;
	Fri, 23 Aug 2024 10:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ov8lz4Nf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617261BF3A
	for <linux-usb@vger.kernel.org>; Fri, 23 Aug 2024 10:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724407604; cv=none; b=N3JVHfWq1Nyt+TqpbubZMV/4uJBk7WUlHSGxmYyPVD5CetFOXq6xGHGCuchYIahx1pE+f+utgi0nN1t7Kn4s0pUzuellBDvguNNA2vd8JsL8U6UMp6Hcm6OVKtlJlyAwkXwJ5rk25JGLybgW9LB1OCxE31UGOE4FYYW+CEbcAPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724407604; c=relaxed/simple;
	bh=CVP7EJ0OTf912MG7wkh0vbPheAHiAcuY1VhSmQz90HI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mO9K3JqDU/4YMUo+8doURaUEYFU6/xBxjmUBq9SeftgOwoFqFW49b//tLAdbC7YZIIHJ65g4jmypDggcpkTcUzASgrEFLfgoc+RRkEuOWDTd30aCmD5X7y8mHXLkw+swNy7UswSY2chJKmPbFeUtwNOgGe2dpWV0V0BubiP3sks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ov8lz4Nf; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5334a8a1af7so1733832e87.2
        for <linux-usb@vger.kernel.org>; Fri, 23 Aug 2024 03:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724407600; x=1725012400; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzZaZSSiKOd10XDFI7N08Px2ROKn6JLFTXZZ+ruAhEA=;
        b=Ov8lz4Nf9sV1E4VwpIB4dc9eYSpk7562pxjm31/HRvGkD8nXzWPFp9voV//l95Kpdl
         ItcULUgn9qEsJLDor6My9S/jkVRsJs24K/Qn+PjYo0uMbBYj9kKOcf5Q50sSG1mUVCP3
         FLSMHwFnWlEQwxReSWdXIvtbs57uTTjxSU7eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724407600; x=1725012400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dzZaZSSiKOd10XDFI7N08Px2ROKn6JLFTXZZ+ruAhEA=;
        b=GYGyBahBccrusDhVP/NDqOvCTnM1n4X/yCZKixTfjMdWpWFWYHvzVeYgYqYO4NxI30
         m6fMBJ5EhJhmGn1t1180nBTFwo/u45iQr9oT6srZH7DEwaYtD8TgFyL5yEXTkGRSPvZ9
         GdLHwFrTPUpOm5nTx59V8DiCju/dabtkBsz0gLH61JkVNgb2SYK4Q4tvvLv69wsGSd6C
         mHCfZZ4WK9oMDlbyKImPgVoU5epVlDqc1vK3EWAK0hadUlg0k+XWwBv5earH8EAtCVIF
         fEoxzkgxkswQv9eOoirUgsw/t7fgbSGcXB9VuNhu0kruwFKqoMF+LqX+9q20ZDcJEeOy
         l+8w==
X-Forwarded-Encrypted: i=1; AJvYcCU6r5knPJercY0vMoJ5IlV5a2QxwIQOyJRrSKZlFTVUOeZbkVnhpYrrAyb6vTz26hlk4hLPr6lPa5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfdID84Z3DylFjGAiI5pnbZbESxHss9WAN7CdkQg9G5F8FB2ya
	F/YplAyYHHoN3FIxSCj8QPt04JprvMSYrAPQzM8Vf+5qMKDLaGD1lfyzUklGM8FRoQOr22r+v8l
	kYYoSXE7VXBqijsfU23y3v5mrg0ogfEveojoV3WNEGzNh5vKE
X-Google-Smtp-Source: AGHT+IETSaCO4LqilNuwf/xE+1vTBCGaKtMcE8F2E1SqcxBUsRD7f6LrSqxPD4jkPDTvI/p8VAnQA263A9m+aZWOYLk=
X-Received: by 2002:a05:6512:10d6:b0:530:c323:46a8 with SMTP id
 2adb3069b0e04-5343877b4cdmr1087270e87.23.1724407599983; Fri, 23 Aug 2024
 03:06:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725074857.623299-1-ukaszb@chromium.org> <121d85fe-976a-43c4-95d2-1a066234a758@linux.intel.com>
 <CALwA+Na218B0PK3QG20_XFovJMfB4ud7B9Z=4kX=xwu8bjAvHA@mail.gmail.com>
 <115eb4be-e336-4a29-84d2-bdafb84a0f9f@linux.intel.com> <CALwA+NbLsg2qfmaHagMNimN0mvU6vNP-rsY31O-9X6oZovAOJQ@mail.gmail.com>
 <8cc19d0a-80f3-48a4-9fd2-0cc42b8ed1f4@linux.intel.com> <CALwA+Na_SORXHFr-GZJtPu_HySd9dwo+UAUsv0sYanrH501o4Q@mail.gmail.com>
 <CALwA+NbUJowv3yKnSoY5e4MBi1kZg=ezE0btB5xnTC=k9+VaQg@mail.gmail.com>
 <CALwA+NbLZ7cm_pSc7Bgh-q7YOr3Ez5_AsG-dyqSzoDyOF=E_JQ@mail.gmail.com>
 <f803fe92-5b52-4c11-a35b-8cc4759f9a7e@linux.intel.com> <0f1a54a6-7a7c-429e-8134-88ea3e1e67ec@linux.intel.com>
 <CALwA+NaH7VC5SjnbQRyXt2NXugZkXyZJa70u9Cw7vdPYe53KqQ@mail.gmail.com> <9373388b-01e1-49b1-8fab-7724aa6454ab@linux.intel.com>
In-Reply-To: <9373388b-01e1-49b1-8fab-7724aa6454ab@linux.intel.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Fri, 23 Aug 2024 12:06:28 +0200
Message-ID: <CALwA+NaOs8xMv9tQN_R5hQhA5=WohGarsGjmLPdrDXjOvRV32g@mail.gmail.com>
Subject: Re: [PATCH v2] xhci: dbc: fix handling ClearFeature Halt requests
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 2:48=E2=80=AFPM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 22.8.2024 6.35, =C5=81ukasz Bartosik wrote:
> > On Mon, Aug 5, 2024 at 5:50=E2=80=AFPM Mathias Nyman
> > <mathias.nyman@linux.intel.com> wrote:
> >>
> >> On 5.8.2024 9.49, Mathias Nyman wrote:
> >>> On 4.8.2024 0.51, =C5=81ukasz Bartosik wrote:
> >>>> On Thu, Aug 1, 2024 at 5:02=E2=80=AFPM =C5=81ukasz Bartosik <ukaszb@=
chromium.org> wrote:
> >>>>>
> >>>>> [  103.707882] xhci_hcd 0000:00:0d.0: Stall error at bulk TRB
> >>>>> 1943ad000, remaining 1024, ep deq 1943ad001
> >>>>>
> >>>>>
> >>>>>> DbC should respond with STALL packets to host if HIT or HOT is set=
.
> >>>>>> Host side should react to this by sending a ClearFeature(HALT) req=
uest to DbC,
> >>>>>> which should clear the halted endpoint and HIT/HOT flags.
> >>>>>>
> >>>>>
> >>>>> I would like to ask you about it again because I wonder when the Db=
C
> >>>>> endpoint is not halted and it
> >>>>> receives the ClearFeature(Halt) request whether this is correct
> >>>>> behavior for the DbC endpoint to report a
> >>>>> STALL error in such a case ?
> >>>>>
> >>>
> >>> Ok, Setup was unclear to me, I assumed the STALL transfer error was d=
ue to an
> >>> actual transfer issue on a bulk endpoint.
> >>>
> >>> I don't think xHCI DbC should send STALL error transfer events for no=
n existing
> >>> bulk transfers as a response to ClearFeature(ENDPOINT_HALT) control r=
equest.
> >>>
> >>> Especially as it seems not a single byte was transferred on either bu=
lk endpoint.
> >>>
> >>> But we need to handle it in the driver properly
> >>>
> >>>
> >>>>> Thanks,
> >>>>> Lukasz
> >>>>>
> >>>>
> >>>> Hi Mathias,
> >>>>
> >>>> One more thing which I would like to add to the previous is the obse=
rvation
> >>>> which I made during debugging the issue. Looking at the above trace
> >>>> there is stall
> >>>> on IN endpoint:
> >>>> xhci_dbc_handle_event: EVENT: TRB 00000001943ad000 status 'Stall
> >>>> Error' len 1024 slot 1 ep 3 type 'Transfer Event' flags e:C
> >>>>
> >>>> And then when 24 bytes packet arrives
> >>>> xhci_dbc_handle_event: EVENT: TRB 00000001943ad000 status 'Short
> >>>> Packet' len 1000 slot 1 ep 3 type 'Transfer Event' flags e:C
> >>>>
> >>>> the same TRB is being used 00000001943ad000 but the DbC driver alrea=
dy
> >>>> moved forward and the IN endpoint's pending list does not include a
> >>>> dbc_request pointing
> >>>> to the TRB 00000001943ad000 which results in "no matched request"
> >>>> error and dropping
> >>>> of the packet.
> >>>>
> >>>
> >>> I noticed yes, this is why the patch compared the TRB pointed to by t=
he
> >>> STALL transfer event with the one in the endpoint context.
> >>> If they match the patch attempts to turn that TRB to no-op, forcing x=
HC
> >>> hardware to move to the next TRB.
> >>>
> >>> The check did however not work as it didn't mask out the cycle bit.
> >>> Lops show we compare  1943ad000 with 1943ad001
> >>>
> >>> [  103.707882] xhci_hcd 0000:00:0d.0: Stall error at bulk TRB 1943ad0=
00, remaining 1024, ep deq 1943ad001
> >>>
> >>> Code in patch:
> >>> +if (ep_ctx->deq =3D=3D event->trans_event.buffer) { // FIXME do we n=
eed to worry about cycle bit?
> >>> +            dev_warn(dbc->dev, "Stall error TRB matches ep_ctx->deq,=
 clear it\n");
> >>> +            trb_to_noop(req->trb);
> >>>
> >>> With the new information that the STALL transfer event can be complet=
ely
> >>> spurious and not related to any actual bytes being transmitted on bul=
k
> >>> endpoints I think we shouldn't give back he transfer req in those cas=
es.
> >>>
> >>> I'll make another patch
> >>
> >> New patch ready for testing:
> >> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/commit=
/?h=3Dfix_dbc_halted_ep&id=3D96cd909cc8115b3d2dff1bdcf265171bb0fdab18
> >>
> >
> > Hi Mathias,
> >
> > I finally tested your latest patch 96cd909cc8115b3d2dff1bdcf265171bb0fd=
ab18.
> > It resolves the issue.
>
> Thanks for testing.
>
> I did some minor additional cleanups to it.
> I'll post it as a proper patch. can I ask you to give it one last run,
> just to make sure everything still works.
>

Sure Mathias, I will test it. Please add me to CC when you submit the
final version.

Thanks,
Lukasz

> Thanks
> Mathias
>

