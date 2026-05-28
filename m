Return-Path: <linux-usb+bounces-38136-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CI2GKnEtGGqyfQgAu9opvQ
	(envelope-from <linux-usb+bounces-38136-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 13:56:33 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7995F1AA8
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 13:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE59030C40D2
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 11:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D4E3E5576;
	Thu, 28 May 2026 11:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6WDVu7K"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B064030BF67
	for <linux-usb@vger.kernel.org>; Thu, 28 May 2026 11:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779969150; cv=pass; b=osLdndptUlzM6wQEz0fZ5gtxMdK3OQuX31uWNkPG6tIf5UZmNVTBCj9p/ay5FHYrEl5UE3/7ZLo/xk9y0XorrhHVbAJMCnVPt6qR+2u8d/yUsmOYoebCY52Ix8/0rDfjuYnqCG5URCAK3Gk8xMMyQePXNTjsWFiihfDpBHs2Dgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779969150; c=relaxed/simple;
	bh=JcjVS6KyLKbZqopsqn3BOtxXjVAlpBXYbyokr+pvFTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LA5frju4BrReROhKnhrYJGCwSLTGRTj7lUpDZk+kRRav8LjtHP3VVvolsa+ZlbXq8h8XWEJlm3lLBACyzTX0TjuDKD1ow8FfIDqjp2H93gV4eeANV8JceFqZpSTyKNqSzwd/je4R/IHeLSZcZ16Vo9lBMJHmckzFSuEPyYPn4K4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d6WDVu7K; arc=pass smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8b1f2b7f1bcso191843886d6.1
        for <linux-usb@vger.kernel.org>; Thu, 28 May 2026 04:52:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779969148; cv=none;
        d=google.com; s=arc-20240605;
        b=aAvnlllkRDYHciEHs5wNaTrYyu+oGti2lDVH2d5GaWdBw5MmouDgZFdF8uKm6rsx0m
         0Bqs2fqtG1Zo68fVPBQ3Yaxi60UTjJKR8AwwjwbjcX2lqsnH/dsJ8jtC407yCf56TnW0
         CA1p1Wra1D1dTvXmhNVut215zjTKU3iR5jwJFZ2vu4Ce6R7i55/5QOEd5RTYF7eTfCuB
         OLE3oDDqeXqzWeTAQAiM2HOPQTNmakjdf7yCWIH+sjfSiWctEWpgO0UOgjYHRv2yce8E
         1e5Ug7ZAQ1qSTUmipxVFuP7DXAQtH+fnAE8IhSX1zhuhG335FvyVpn2zQPkh1JZolExE
         qZxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JeDf1nO8AnPCJfXXSbBMPR0RtNsl6Tp8g3d1EFDsX9M=;
        fh=DJ99Es+DGk7nlHYh/Yr2PN+7Wb/rBr8WXQQWckgdMNc=;
        b=f9d7SEHu8m6SeEP/ReDrs+Tk1J3vPZ8hqIuprbrC296MdmfrjvaOzLUA0cEb/YLrPl
         0ArG/v/ddUPas3ZQiOdI3uEawaTKtys5CisAM5Pwfpu88KUA48vKnUhqLQJ0ZO8eUDIa
         rlPOfqXUdYCqCzsLGWc6271m0ZA0J/8Rbx8k4Q+Az/UblpuOpqqPflSyHugphyqJYiIQ
         RRJevfHFuDW05foI34/Bt71OTIoFYUyIKOJUiqn1xrS96gbSuoBjdaXsxa8YPPpz9cd2
         9zRqQ1CmjmycCXISi3D/Uz7Hqm/uf4/g3C9e+96n3kpS/9GqrmBzq0gkd22MJGrFh/Gr
         IBPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779969148; x=1780573948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JeDf1nO8AnPCJfXXSbBMPR0RtNsl6Tp8g3d1EFDsX9M=;
        b=d6WDVu7K7PUwv7kdFFi+xV0pdaAIybL1Hr99dZCY48WDXPlc482ljW2LHwT76Q8b0Z
         9xj7RUiWkWqmg7o/vWeVHPa9P7CKLn9qsp+eFTiXCs2zALDdhq1ZG3/vB2/8WDT8N0Qg
         XH6fPFEsV9R4PWifEdX5CNsCTa+e5G6HwE3lBJXjxEgXILi50P5mS7HA9Sk6RdLMzrwa
         0F++IR2uLUoVbbXRrQHOC6mtClIjTT2YFRZiRuN/jhtYqL5crNPZ6gXeblNAEeRV0luD
         cTQ+oUX4s/5HIOwv8qXvpK9Xv9LhvTr7hj/zABtdWyv9V3HJSaYH9HCHga2iILbwy7i2
         fHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779969148; x=1780573948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JeDf1nO8AnPCJfXXSbBMPR0RtNsl6Tp8g3d1EFDsX9M=;
        b=Zd3mPkko20rj/nD+Cp9R0mLwEM3bPlwUNRTFtSviMoalMleNNmAbrQ8I8hnAumd5+B
         uiNvKxPA1LQG+Fv3vHi/S6CYr9nME/DjcTIO62cBJQfhwjME5rhKP9hVM90zc7lgcwzI
         MATC4aQG7pmFSH80/TqQsB59f5H3vQy+UBRB2TW02AI4K4Bu1yekLMhlaFHUsM1aMecb
         Dxo1AIpLYkWTg/zNqroRdUzdVFfm8OXPO8VtcpuFKFKZEIWmiFYYg138hRdDT9PhTBiJ
         s2ApSxVrZZLPD2d7qxsHYwyDrYeIp9EghWmfSVYRFrOUfsZn449neP1gJKzst/WRE+or
         9qTA==
X-Forwarded-Encrypted: i=1; AFNElJ+Mz4kA3t7CHpt9bVXpUGdOPqMs7SuBHIfiGc7orGjGzT7f+Fi4MqptQp+lwhB/Yuf4QEhMCb9xCFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP0GdjeLTY+gSUZeA+16wUW9/7wN0fEb+HVFTrw+ubvMG9WlXl
	Lb5wU3XWwGB9gqoHwtAafesx7GxAO/wLXYzFOCXcXmm/Y4TjAAnyj09LJ+xCIFWEtOeusNMp2ZT
	A8Z6TkkNOoQnKcX4P/ep4JYtoWpU7LHE=
X-Gm-Gg: Acq92OEmVfF/icRnnnGkRHDL/E6mNTNOW/zMh3Kdw98xe6E9YtUmYK+8PfG6jJ/Q7pS
	9U9Lfg3/o8I2/aHjQju8L+oosjb23PI94Z5mEM1jbUUGYOxFAWmJr+YebYecuig5iqLu8RUf+/1
	E5eVLEpJCsYKRDb0NXRUCtu3LoP5Ar3bSPDCntT3qFGKfREk5QCAmWPRIKkvxRi326P4uc5DQns
	Xj456/JsyHt7rGB3Gyh8Wf3JobVSLbRtPTBvhM0Kd0DYygvM8xZPlx3JDxpieI+6goYB8aBbzOv
	OUoBOpAXdIYSvrvhSjypzAm1a//TNywKPp7dgU9EQ0EMfDkX
X-Received: by 2002:a05:6214:2607:b0:8cc:d74a:8dff with SMTP id
 6a1803df08f44-8ccd8abed09mr13579896d6.5.1779969147600; Thu, 28 May 2026
 04:52:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+_z3hRjPnQOrEp7uXsNsu6wzqQp9O6FT18i=XcSC7k74Xd2QA@mail.gmail.com>
 <20260330020749.18fbe433.michal.pecio@gmail.com> <CA+_z3hRTD-QAgv3jZhOZUUPA0sNZ8946jfYwYsZ=RnQJ0LG7cw@mail.gmail.com>
 <20260404152438.582f0451.michal.pecio@gmail.com> <CA+_z3hTMfggtv+u_A_SRyb2FRzVjm=Nav5NRCTuhmEthb8x0jw@mail.gmail.com>
 <20260509180603.6f67c9d8.michal.pecio@gmail.com> <CA+_z3hT_n09fAszT+DkoTHLzracB7fQZwkiiTxGGBJxhFcD8hg@mail.gmail.com>
 <20260512120334.4eef3d0b.michal.pecio@gmail.com> <fc2d9862-6c46-4161-8fd5-68b9e6c2e8bb@linux.intel.com>
In-Reply-To: <fc2d9862-6c46-4161-8fd5-68b9e6c2e8bb@linux.intel.com>
From: Martin Alderson <martinalderson@gmail.com>
Date: Thu, 28 May 2026 12:52:16 +0100
X-Gm-Features: AVHnY4KsOd5qfNreK3dMVzO5r6Xi1Bh4TRNDJmm76iF9iWI0_UR3eEaXbJzg6xc
Message-ID: <CA+_z3hRdXfZm2ziCmsXEDEY-i8XJjxnw2oe6mkTf+O+B0fx91A@mail.gmail.com>
Subject: Re: xhci_hcd: AMD Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8] dies
 on resume from suspend
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38136-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martinalderson@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,intel.com:email]
X-Rspamd-Queue-Id: 3D7995F1AA8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Caught a fresh failure on kernel 7.0.9-205.fc44.x86_64 with xhci_hcd.dyndbg=
=3D+p:

Timeline (single suspend cycle):

  11:09:45  xhci_suspend: stopping usb1/3/5 port polling
  11:09:50  xhci_hcd 0000:0f:00.0: xHCI host not responding to stop
endpoint command
  11:09:50  xhci_hcd 0000:0f:00.0: xHCI host controller not
responding, assume dead
  11:09:50  xhci_hcd 0000:0f:00.0: HC died; cleaning up
  11:09:52  xhci_hcd 0000:0e:00.3: port resume event for port 1
(keyboard wake)

5-second gap between suspend start and HC died - the stop endpoint
timeout you predicted.

Command ring state at death:

  0xffffe070: Stop Ring Command: slot 1 sp 1 ep 1 flags C   (completed)
  0xffffe080: Stop Ring Command: slot 1 sp 0 ep 1 flags C   <- dequeue (stu=
ck)
  0xffffe090: empty                                          <- enqueue

  enqueue - dequeue =3D 1 TRB pending
  USBCMD =3D 0x0   USBSTS =3D 0x1 (HCHalted)
  port01 portsc =3D 0x663  Link=3DU3 CCS PP PED


I have the full snapshot: command-ring/event-ring TRB dumps, all xhci
debugfs registers, dmesg with full dyndbg trace, and the kernel
journal for the cycle. I'm not sure the best way to send it though if
you need it?

 Martin


On Tue, May 12, 2026 at 3:01=E2=80=AFPM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 5/12/26 13:03, Michal Pecio wrote:
> > On Sun, 10 May 2026 17:29:26 +0100, Martin Alderson wrote:
> >> 1. The timing is during suspend in every single failure I have logs
> >> for. I went back through 7 weeks of persistent journals and pulled the
> >> context around every "HC died" event. All 9 failures show the same
> >> sequence:
> >>
> >>    xhci_hcd 0000:0f:00.0: xHCI host not responding to stop endpoint co=
mmand
> >>    xhci_hcd 0000:0f:00.0: xHCI host controller not responding, assume =
dead
> >>    xhci_hcd 0000:0f:00.0: HC died; cleaning up
> >>    PM: suspend devices took 5.5--6.1 seconds      <-- elevated
> >>    amdgpu 0000:03:00.0: MODE1 reset
> >>    ACPI: PM: Preparing to enter system sleep state S3
> >>
> >> So it's reliably during suspend, before S3 entry, and the elevated
> >> "suspend devices took" matches the 5s xHCI stop-endpoint timeout. A
> >> clean suspend on the same boot takes ~0.46s.
> >
> > The S3 state probably doesn't matter, chances are that it would also
> > happen with s2idle or hibernation.
> >
> > Could you enable dynamic debug before every suspend (or permanently
> > on every boot) and collect a dmesg log of this happening again?
> > And maybe also a snapshot of debugfs directory after resume but before
> > unbinding xhci_hcd. These may contain clues what triggered it.
>
> It's possible there is a race between queuing a command and suspend.
> It looks like nothing is preventing a new command from being queued while
> suspend stops the host from running, thus causing commands to timeout.
>
> Suspend isn't checking if there are pending commands, or if command timer
> is running either.
>
> I wrote some debugging code, can be found in my debug_hc_died_cmdring_rac=
e branch:
> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git debug_hc_di=
ed_cmdring_race
> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=3D=
debug_hc_died_cmdring_race
>
> If it prints
>    "Can't queue command, xHC not accessible (stopped?)"
> or
>    "Suspending and stopping xHC with pending command(s)!!!"
> Then we have a queue_command - suspend race.
>
> Code below for reference
> Mathias
>
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index e47e644b296e..50ce4a4a7fe3 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -4353,6 +4353,7 @@ static int queue_command(struct xhci_hcd *xhci, str=
uct xhci_command *cmd,
>                          u32 field3, u32 field4, bool command_must_succee=
d)
>   {
>         int reserved_trbs =3D xhci->cmd_ring_reserved_trbs;
> +       struct usb_hcd *hcd =3D xhci_to_hcd(xhci);
>         int ret;
>
>         if ((xhci->xhc_state & XHCI_STATE_DYING) ||
> @@ -4362,6 +4363,14 @@ static int queue_command(struct xhci_hcd *xhci, st=
ruct xhci_command *cmd,
>                 return -ESHUTDOWN;
>         }
>
> +       if (!HCD_HW_ACCESSIBLE(hcd)) {
> +               xhci_err(xhci, "Can't queue command, xHC not accessible (=
stopped?)\n");
> +               xhci_err(xhci, "called by %pS from %pS\n",
> +                        __builtin_return_address(0),
> +                        __builtin_return_address(1));
> +               return -ESHUTDOWN;
> +       }
> +
>         if (!command_must_succeed)
>                 reserved_trbs++;
>
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index a54f5b57f205..04279fbbe1dd 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -949,6 +949,34 @@ static bool xhci_pending_portevent(struct xhci_hcd *=
xhci)
>         return false;
>   }
>
> +static void xhci_dump_ring(struct xhci_hcd *xhci, struct xhci_ring *ring=
)
> +{
> +       struct xhci_segment     *seg;
> +       union xhci_trb          *trb;
> +       dma_addr_t              dma;
> +       char                    str[XHCI_MSG_MAX];
> +       int                     i, j;
> +
> +       seg =3D ring->first_seg;
> +       dma =3D  xhci_trb_virt_to_dma(ring->deq_seg, ring->dequeue);
> +
> +        xhci_err(xhci, "Dequeue: %pad\n", &dma);
> +
> +       for (i =3D 0; i < ring->num_segs; i++) {
> +               for (j =3D 0; j < TRBS_PER_SEGMENT; j++) {
> +                       trb =3D &seg->trbs[j];
> +                       dma =3D seg->dma + j * sizeof(*trb);
> +                       xhci_err(xhci, "%pad: %s\n", &dma,
> +                                xhci_decode_trb(str, XHCI_MSG_MAX,
> +                                                le32_to_cpu(trb->generic=
.field[0]),
> +                                                le32_to_cpu(trb->generic=
.field[1]),
> +                                                le32_to_cpu(trb->generic=
.field[2]),
> +                                                le32_to_cpu(trb->generic=
.field[3])));
> +               }
> +               seg =3D seg->next;
> +       }
> +}
> +
>   /*
>    * Stop HC (not bus-specific)
>    *
> @@ -999,6 +1027,12 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wak=
eup)
>         /* step 1: stop endpoint */
>         /* skipped assuming that port suspend has done */
>
> +       /* Check if command ring is empty */
> +       if (!list_empty(&xhci->cmd_list)) {
> +               xhci_err(xhci, "Suspending and stopping xHC with pending =
command(s)!!!\n");
> +               xhci_dump_ring(xhci, xhci->cmd_ring);
> +       }
> +
>         /* step 2: clear Run/Stop bit */
>         command =3D readl(&xhci->op_regs->command);
>         command &=3D ~CMD_RUN;

