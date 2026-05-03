Return-Path: <linux-usb+bounces-36850-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBJ5OvXC9mlsYQIAu9opvQ
	(envelope-from <linux-usb+bounces-36850-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 03 May 2026 05:37:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E534B44A3
	for <lists+linux-usb@lfdr.de>; Sun, 03 May 2026 05:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0917300D152
	for <lists+linux-usb@lfdr.de>; Sun,  3 May 2026 03:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A2A35A388;
	Sun,  3 May 2026 03:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bBkG/S+d";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FNrz04ET"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275D4CA52
	for <linux-usb@vger.kernel.org>; Sun,  3 May 2026 03:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777779405; cv=pass; b=eM8zAB56FfdfCDUbRMa2IYPY2nElWAIJSq8w/01hyziu8NWKRH78OtmTLvAMiAl0T/orWy3bFpXrnotT/nROfIwzF/fsshdzDWCCL8A2lQVia8xqpC+1jqZgH8nKUtfXORWKrKu6Qpf8L3aJfPcqJOWDojicT5zxHaaDlCjkAk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777779405; c=relaxed/simple;
	bh=tUydmwkNKViZy7RWTMXdSuRd5OkjMnnrGh50lyioA8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E9h4zOYWEZEW4MO+SjhMRfSFZTWQU3ntX2QtcjOM/QY88g9378P83TphFP804wLNyAq07G10hs6MNdeELlbvjYn1+sOnzopwJOvcfBRbLlWw6k1NHLaliYBPgE3sjIbXZPmgTpR9RtxC/Gzv5kLPdm1YAkAhn0RQ9lXWz+0GJY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bBkG/S+d; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FNrz04ET; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777779401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q0OWAJn8muYcHbaFRLc3IDvQHdIxLvENWnakgrL5hdI=;
	b=bBkG/S+dx6B64hak395LKasQNKEV+YxL4ZM7oJYFRK6Rbefd/8LS2BbqkJhv86Cktj5Lam
	JP8PjatvSQPaoCFAHPssIbuAVtN1GQHpdNW3bxCsNz4yF0Obc871Svl53Ij14E5NYv49Nh
	VLUU4swoU1f+WUagIDmi0wZL2d7iSxM=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-TBrTG2TKNSuNV8LAEKuPoA-1; Sat, 02 May 2026 23:36:39 -0400
X-MC-Unique: TBrTG2TKNSuNV8LAEKuPoA-1
X-Mimecast-MFC-AGG-ID: TBrTG2TKNSuNV8LAEKuPoA_1777779399
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-69492bc3a38so4038221eaf.3
        for <linux-usb@vger.kernel.org>; Sat, 02 May 2026 20:36:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777779399; cv=none;
        d=google.com; s=arc-20240605;
        b=XNa4+jHmD49gZkIQgZOt6sm0MeQIBWcuqZem6q/4UlhB7J7ZW2VAzetheg2HbyoKNq
         2iQymnu/E0Jpd3zIt862t59N7YBnvfGbBE8fDWeFfGNibUtWqDju14ApibLq0YwNaPGM
         urWFKsLH/EW4cS5L+ndfDama24uHkkfzO5olR+BijqiszuA6r0rfjyIyjkjAw2wH4JwA
         qLsBg+igOzky4Vl+PBuS5dki6DE+TGrGYQqpMExUbi55lbOa49o4KWZKYlo0ax+pwZ3Y
         H7uduc1G9yiMg9KTzcOCYfAiiVLocLwwB0wUcO3iFjr4do0BUF1v509lMLb9JmVSB4/P
         8pVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q0OWAJn8muYcHbaFRLc3IDvQHdIxLvENWnakgrL5hdI=;
        fh=OaGYKWa3Nx4XGCI++PS1mc8RoN2YEWw5lLILdrmm5Ag=;
        b=HLo3Eezs0QEaENfrZnDuEslswzdJs2xlGyD9uc8KrS43ijtdJ0QoMKraDUN0h71EZa
         W1XvTV8yE6PxJQZJhwGFwtiZQ4ck1A/JJQ3TkTEudqoMcNMT9ReYgu8zd2ZVLWytVf/0
         g6pZZ1xrwVdUXZCtynPrpnL0tMzBz1jC0cuY3KdNHqduIJbfSU9Z2v+CpNR/aleqEy/m
         ag5jSoc2uLV1rc2QYqb3/PADmZW2VVQ8/gWKR57/DBvMEy9hgcBKXT0Ph9XDzKV6KB10
         6awsXJtz1r+a33d43FTBg4QFAAUT5huAocmMHueQ1OlAWjmaBxBiFsNikveJB+4q/oTA
         BfZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777779399; x=1778384199; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0OWAJn8muYcHbaFRLc3IDvQHdIxLvENWnakgrL5hdI=;
        b=FNrz04ETKSwVn2sLOSVxA+61+lBmKpipMuY9N2TAz1MhJNCuCzR8RBXce33PQKAyeK
         B96ZCh/nVLJYpZ9ytFt/nwaePduTEIkS4DFZxMi5XKiPUKqw5EUHsgYoiVeeslqDv0yQ
         idnk3NQ6Ev6/mi9iE5d4/GlLEfwGbH6xnSLEcKF9c6xcLifTnRlPpw9XhiGxjvgZ/i3z
         ZygPdv0sDC9rNnkyCWcIqN0vSmCtwZK3jgRbiluosp+SeKZZv9dFzHNnb1guxSUBjjXa
         88fOQSsL83ACD8sKo1kr8f6XfYh8uEy65OtGH/uG6G31DTSgU/vmkQvWRfhH6a37NRLJ
         ed6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777779399; x=1778384199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q0OWAJn8muYcHbaFRLc3IDvQHdIxLvENWnakgrL5hdI=;
        b=k50JFqZGoKnSkpAoFlC0ewEAqDZMAa/GApixNzy9VkBimvr8vEoBVG0a4O86e2EjeQ
         a3eW0bq1cM42dGDNYu5yBFTJzhgJ1esZozDU677r09GnudgxjGkuzAEeEWuMTNVUOA+j
         hU+N9R+pX6f/UvMsNfVVMXgqR6Bv7S0sFvevCUHv273kZkpxnW3JEQoCXaDM+F1M2vTM
         PlXCqmEQtZjaK42OI2hjMZk17rTLIPoaQfvXSS6bK1VRIK7X0y4fdMtWLcxI2GXGbjuw
         OPlq+R1FEEuFQYCrcQsDBnSGaONZO3Tp1V0RKH12U1hybn9bKxLefEeS/ILrWw/UJUAt
         iNyg==
X-Forwarded-Encrypted: i=1; AFNElJ+Y7EkNlB6O21PT/aaofMFsXAq6pmAMkEI/suArRPKmUVCNPERJCFXfEgZ0bwOswaV2Ue3zKToqgcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ9PXpPjeAtl6eLGIL1L+Ji9qGtMVjCOLD4s8s7swM0+4RVE3z
	SBWKQLNDk1GwuBri8nTYNoodUW+ZsRkcpHLZeC+eXF/qf266Jg6AbNPaJHwXySUALAhb7z7MfK5
	p/BwYtbpMme0YgNXVJiCB6dLT9uu91PnsMuNpn3Pn3/ZGujNMQ6Wlmro1wC9Rtit5AQpNpCzIzy
	/D46w0wxs+U+4FK5IO5HdrXiNMwcOO0cB+q03+
X-Gm-Gg: AeBDiesJHLFpd0d/q32RpkBDXRE0oF8puYigEFE9VWVDfzR/BC8jMBQ8q4+R02UoUcu
	IGBeW16+ZcoXphWqE1qQ+iwjtD+ebyw1CS1tLKVoqLuCZJCdSf2niW+YLHTLRsjbqkY7eo42fH7
	7X7JOxY5ojYcOyBlX6HbWaGoQEzx45rQQAX9xi0m7CFd+7mD7GxPTuqmD7g8TI7wzN7fdDeKKTk
	JvymsrKcp+Cs+cYVTFR4R5NsD3YQQOiu6MfwsoP/o22ZLlx
X-Received: by 2002:a05:6820:81c9:b0:696:637e:4820 with SMTP id 006d021491bc7-696979f55d3mr2541005eaf.27.1777779398957;
        Sat, 02 May 2026 20:36:38 -0700 (PDT)
X-Received: by 2002:a05:6820:81c9:b0:696:637e:4820 with SMTP id
 006d021491bc7-696979f55d3mr2540994eaf.27.1777779398545; Sat, 02 May 2026
 20:36:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430014817.2006885-1-desnesn@redhat.com> <20260430104850.352bd946.michal.pecio@gmail.com>
 <CACaw+exdPSVSfdAob7+d-xH=JEjBbPpY_z1cPPU6rzXx4wUZpA@mail.gmail.com>
 <20260430235453.2288c973.michal.pecio@gmail.com> <CACaw+ewwM_5eqyGW5=+THwHsYPs7u3NT096AFQdt6x4E6HcWtA@mail.gmail.com>
 <20260502114644.76e6b5a3.michal.pecio@gmail.com> <CACaw+eyKh7buHDoDyTOe8O65FP5cSXYdzCcQvwqKw=1DwX26oA@mail.gmail.com>
 <20260502235517.089ba5bf.michal.pecio@gmail.com>
In-Reply-To: <20260502235517.089ba5bf.michal.pecio@gmail.com>
From: Desnes Nunes <desnesn@redhat.com>
Date: Sun, 3 May 2026 00:36:27 -0300
X-Gm-Features: AVHnY4JrHk59WE05_dg9TKwGgt1QjyIQVcj0PtqyhuDEWMRv0JtTFXsQeGGmvRs
Message-ID: <CACaw+ewOTVh49tnkz+cRr0SD_Z-LmYrMWhFUrsik6YF83mPBtA@mail.gmail.com>
Subject: Re: [PATCH RFT RFC] usb: xhci: Kill hosts with HCE or HSE on command timeout
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	gregkh@linuxfoundation.org, mathias.nyman@intel.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 65E534B44A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36850-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[desnesn@redhat.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hello Michal,

On Sat, May 2, 2026 at 6:55=E2=80=AFPM Michal Pecio <michal.pecio@gmail.com=
> wrote:
>
> On Sat, 2 May 2026 08:38:34 -0300, Desnes Nunes wrote:
> > > diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-rin=
g.c
> > > index e5823650850a..3041deb67b57 100644
> > > --- a/drivers/usb/host/xhci-ring.c
> > > +++ b/drivers/usb/host/xhci-ring.c
> > > @@ -1761,13 +1761,15 @@ void xhci_handle_command_timeout(struct work_=
struct *work)
> > >         /* mark this command to be cancelled */
> > >         xhci->current_cmd->status =3D COMP_COMMAND_ABORTED;
> > >
> > > -       /* Make sure command ring is running before aborting it */
> > > +       /* check for crashed or disconnected chip */
> > >         hw_ring_state =3D xhci_read_64(xhci, &xhci->op_regs->cmd_ring=
);
> > > -       if (hw_ring_state =3D=3D ~(u64)0) {
> > > +       if (hw_ring_state =3D=3D ~(u64)0 || usbsts & (STS_FATAL | STS=
_HCE)) {
> > > +               xhci_info(xhci, "kill the damn thing\n");
> > >                 xhci_hc_died(xhci);
> > >                 goto time_out_completed;
> > >         }
> > >
> > > +       /* Make sure command ring is running before aborting it */
> > >         if ((xhci->cmd_ring_state & CMD_RING_STATE_RUNNING) &&
> > >             (hw_ring_state & CMD_RING_RUNNING))  {
> > >                 /* Prevent new doorbell, and start command abort */
> >
> > FYI, sorry to be the bearer of bad news, but this also panics the
> > system as soon as I run `echo c > /proc/sysrq-trigger`.
>
> Is this not what's supposed to happen?
>
> Sorry, that complaint is so odd that I thought I'm seeing another case
> of debugging being outsourced to an AI chatbot, which forgot that panic
> is triggered intentionally here. Now I'm just confused.

No, guess you actually saw a case of poor explanation on my end -
apologies for not explaining the outcome properly.

What I tried poorly to explain was that the system simply hanged after
I intentionally triggered the panic with a sysrq - both times.
Nothing happens after the sysrq panic stack trace.

> > Kdump doesn't run and no vmcore is produced:
> Is the kdump kernel not launched, or does it crash during boot?
> The latter would make sense if there is some problem with the code.

Kdump kernel didn't launch at all, thus no vmcore was produced.

> But I don't understand how patching xhci-hcd could possibly have
> any effect on the former. Does this new code execute at all? Does
> "kill the damn thing" ever appear in dmesg?

Both kernels booted normally: the first one checking HSE after USBSTS
was logged on xhci_handle_command_timeout(), as well as this new code
checking for ring state or the HSE and HCE bits.
Since kdump didn't start, the message "kill the damn thing" never got
a chance to appear on crashkernel's dmesg.

Best Regards,

Desnes


