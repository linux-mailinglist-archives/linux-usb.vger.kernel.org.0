Return-Path: <linux-usb+bounces-37446-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDBGDg4XBmp3egIAu9opvQ
	(envelope-from <linux-usb+bounces-37446-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 20:40:14 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C67545F4B
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 20:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 319A5307CCD3
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 18:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA7939DBFB;
	Thu, 14 May 2026 18:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QOPEbyXU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8BF391833
	for <linux-usb@vger.kernel.org>; Thu, 14 May 2026 18:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778783898; cv=pass; b=YE+r2EKF9gOhheOM3r7siykmZz3nopFzJBTXMBMQZYICT+aZ8D44uDUtYiqrfzhvB8y2umYLxmKDImJDK7u/9Vmju94arql/1f+f8flG5n8Tm9P1mnLykKvBa7xpeVIUeVo1r/bsYu7pMlMbShzE30YJFOn65n4idT0vuOmi47M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778783898; c=relaxed/simple;
	bh=QmmK3gZXRGs6+Ov33ViGi5VndHouGarK1Vb3M71UiFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NJlAPWxiYS0NNFtRfzO70z5XwKcEs975Z/NoUhfAwV9oYE6iLBqixIZZ187o4pVQ6kcwNw7elwBfdTWSQhrUDkYdxf8AD8TO+NocXqE5Nvd45Tb9B/LXDnWKGE/YI28rMuL8blfavo8BXlWUBekp/tk1ZFbIe6l1Ysexhx+oSbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QOPEbyXU; arc=pass smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7de46b8e432so7926764a34.1
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2026 11:38:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778783896; cv=none;
        d=google.com; s=arc-20240605;
        b=TFV+PtIwOsUqRAMudDHX1fBQSGtemBBvwJ8s/f7W5g/YkwP5wlIW3/fnWt3wse/X4r
         u0sQbus0CSF/gWGGz0C+mwXD++So+rReD4abAHJu8BXM8R8R0tV+cCtuEKItJ1i4S+VA
         NBIK9LRkJeL+SpyaX2lCYweoOcK1TJhAKNzANJh4yRmHTOjx7kK/6CNp/aMHt7Bm+vR1
         bQLvl9JQtMHsUibrykm+rSVViTmUth8TdRPYgC3wT15CKejYsldaPU1JNjkNOUhdHEYE
         Ri1mdBiF68JRtaMFPIJ+4rrvgwTNd/T04my5sh14xpTxbWUBi9gsFp7R13w3rhLMFKno
         vS+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8d3m45v6Iw/R68LfgUS67OuzNpSS1/BQBBitSivrqSE=;
        fh=SmH65G+AXP2Dk647FvEpoXmd0ryuG0m2j2dJ5YodQ2Q=;
        b=QAqCz/htFt+/dQHJX3QQnSTge2IAjJHjf5d73+hCfdTSrNldgpsnzzAutZwuVDlgkB
         ZAtXID16EN9/o4Xa9AveZvAEw0AOOnV/fLAp4qOKsJ2ceMsbKYRSeZtDLHc5X+omOS3H
         5O6mJsCn1ZO+b5OvpK5ul5eIksiSQDVqau2k8D/lzDteFL8Mcnh3c6qDwVoU6/pPmClz
         C7tR3Irinc8fSTW9XamXdoDgzlVwwtkmTsdp2Vdo/d9eKhPb11OK/LNoqybrFWo22+Dg
         qiS9Y7OYT2/w63DbY+5TsGlCrsmwSli9ozmC5TfaOCZipHNcN68KgTqQn1ypLOF0hnXb
         9OPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778783896; x=1779388696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8d3m45v6Iw/R68LfgUS67OuzNpSS1/BQBBitSivrqSE=;
        b=QOPEbyXUN9AtspgiutVp515+/SiqtiEcQoKK8wUdKV8yBY3/sEIOcDR61oqAipKuAU
         MijtJZyhlJ4qC4w3xnUFKR7nJIWFGRZa+FFnWcbsRebXgpG7wPeycOklD0eC9ICvn1Y7
         aBR00hjBGya3bailIrPC5vFfzPoHMjzE3w5KIGb31+kojgRNAiZhqtEDVt2OKEdkws/S
         oQVjEJfIPK+kg8CEaM9q5MM4oon+mux8k1LacgvSny4gZFL3/vqLPXsdxEGDJ1345SHG
         hgDabuM0ZjKWEDSlimPc6ALWGDyMnyEeEMomQStncAPDktinJ8jK3CJRDWOhwJwNcMJl
         2nfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778783896; x=1779388696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8d3m45v6Iw/R68LfgUS67OuzNpSS1/BQBBitSivrqSE=;
        b=Tbd9hAZd4HyabC7I9VC5MVJQKRU3a+xuLT6cYr3eybkdCeZyBHtnZlQrMXU99zHvEn
         E6F+sbQf9e+nCPM5vmHizR14Eej8+yppifq056LBIKY7OdCrAphICU/fVUYhxPkNMyfR
         aeeLtClsS2hB/lwp7f3foVC7SmTsaHsx8goN7f+B70mK9RivORgXwFrwr2XYtEn749V1
         bvQGjiSKS/koiUJXWVJVdOFjrvije7n+A/xDDPL9NU3sF6qutKbW632TUsHAO2Epaxs6
         Au7Znwc2lYLoegAcFtvdB2iwbWig9a8vImZWzJ83WNJvQj+jm38SIhlMovgXbrMxJ55C
         FQBw==
X-Forwarded-Encrypted: i=1; AFNElJ/ouw4Tp4hXz2yKEVa4pa5+6ZND3+Y9C4ieZc39GQ+B4IaXEumEYgx8nIJgMHVEp3J/q4uGHYfPYaM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwapJvbgsBdmg1PSZiNhgXpdb7RExbuqEjdezI5VgD31LanTxi
	c2D16356N5dYFdPM+7FBqDdYO4tAnPq3pMVDpguAJawy5O7673u6xRauRABPq6IK2N205hsTyQ1
	PiMZgDhCCv9agraObSsiLxrTx+Yo/CmGcp0ts0Yd8JVbAmUKHFjCEL/pLU+M=
X-Gm-Gg: Acq92OG84i9joKN58LETwO5MEBkSKJAvobiEsIGso7F9mx5ih3JZKvRm+tXO5FDqfsp
	HEEM6SzGbicF8SbhxOKt3vkmO6EQtO/zDJwaiQhrBmPs3hrt3jEJySEDzaKEJmh/pH88lBdI801
	3F0hijnZzG8B7vfKKJZcBSEdIXKmAXgJAC0CDUgordj2wNJmoJW9FEJsJd/Zbk1YQp/AJy6vG3W
	9qv7WKWwRhKDc96fiOPhYY7yfLCMLm8eOahEQBeTeDAtVDkwon70zy4PTEllYG8ZNz+4WaxU9cY
	8Fji6fh85f3R5BR7KNfylDyrjisBgov0lavUlHj//b5tYIqo
X-Received: by 2002:a05:6820:221e:b0:694:9a0a:6fa9 with SMTP id
 006d021491bc7-69c94319189mr457604eaf.26.1778783895868; Thu, 14 May 2026
 11:38:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424074009.2979266-1-xu.yang_2@nxp.com> <ae8tabVDj2iH6IQf@kuha>
In-Reply-To: <ae8tabVDj2iH6IQf@kuha>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Thu, 14 May 2026 11:37:38 -0700
X-Gm-Features: AVHnY4KBVyf-SG8Xkj5bjhwsikanhfJWOZBg7c_1lmiP6TpWVoU1BDbUjw6MAe0
Message-ID: <CAPTae5KX51fbs8Yd5LKtRhgOXKFEWzg8AE1Z8eUovTuxonYetw@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: tcpm: fix debug accessory mode detection
 for sink ports
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Xu Yang <xu.yang_2@nxp.com>, gregkh@linuxfoundation.org, 
	m.grzeschik@pengutronix.de, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 83C67545F4B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37446-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[badhri@google.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Action: no action

On Mon, Apr 27, 2026 at 2:33=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Fri, Apr 24, 2026 at 03:40:09PM +0800, Xu Yang wrote:
> > The port in debug accessory mode can be either a source or sink. The
> > previous tcpm_port_is_debug() function only checked for source port.
> >
> > Commit 8db73e6a42b6 ("usb: typec: tcpm: allow sink (ufp) to toggle into
> > accessory mode debug") changed the detection logic to support both role=
s,
> > but left some logic in _tcpm_cc_change() unchanged, This causes the sta=
te
> > machine to transition to an incorrect state when operating as a sink in
> > debug accessory mode. Log as below:
> >
> > [  978.637541] CC1: 0 -> 5, CC2: 0 -> 5 [state TOGGLING, polarity 0, co=
nnected]
> > [  978.637567] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
> > [  978.637596] pending state change SRC_ATTACH_WAIT -> DEBUG_ACC_ATTACH=
ED @ 180 ms [rev1 NONE_AMS]
> > [  978.647098] CC1: 5 -> 0, CC2: 5 -> 5 [state SRC_ATTACH_WAIT, polarit=
y 0, connected]
> > [  978.647115] state change SRC_ATTACH_WAIT -> SRC_ATTACH_WAIT [rev1 NO=
NE_AMS]
> >
> > It should go to SNK_ATTACH_WAIT instead of SRC_ATTACH_WAIT state.
> >
> > To fix this, add tcpm_port_is_debug_source() and tcpm_port_is_debug_sin=
k()
> > helper to explicitly identify the power mode in debug accessory mode.
> > Update the state transition logic in _tcpm_cc_change() to ensure the st=
ate
> > machine transitions comply with Type-C specification. Also update the l=
ogic
> > in run_state_machine() to keep consistency.
> >
> > Fixes: 8db73e6a42b6 ("usb: typec: tcpm: allow sink (ufp) to toggle into=
 accessory mode debug")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>
> FWIW:
>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>

>
> > ---
> > Changes in v2:
> >  - update tcpm_port_is_debug() in run_state_machine() as well
> >    as suggested by Amit
> > ---
> >  drivers/usb/typec/tcpm/tcpm.c | 25 ++++++++++++++++---------
> >  1 file changed, 16 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcp=
m.c
> > index dfbb94ddc98a..6d258efae6f0 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -732,9 +732,14 @@ static const char * const pd_rev[] =3D {
> >        (tcpm_cc_is_source((port)->cc2) && \
> >         !tcpm_cc_is_source((port)->cc1)))
> >
> > +#define tcpm_port_is_debug_source(port) \
> > +     (tcpm_cc_is_source((port)->cc1) && tcpm_cc_is_source((port)->cc2)=
)
> > +
> > +#define tcpm_port_is_debug_sink(port) \
> > +     (tcpm_cc_is_sink((port)->cc1) && tcpm_cc_is_sink((port)->cc2))
> > +
> >  #define tcpm_port_is_debug(port) \
> > -     ((tcpm_cc_is_source((port)->cc1) && tcpm_cc_is_source((port)->cc2=
)) || \
> > -      (tcpm_cc_is_sink((port)->cc1) && tcpm_cc_is_sink((port)->cc2)))
> > +     (tcpm_port_is_debug_source(port) || tcpm_port_is_debug_sink(port)=
)
> >
> >  #define tcpm_port_is_audio(port) \
> >       (tcpm_cc_is_audio((port)->cc1) && tcpm_cc_is_audio((port)->cc2))
> > @@ -5176,7 +5181,7 @@ static void run_state_machine(struct tcpm_port *p=
ort)
> >                       tcpm_set_state(port, SNK_UNATTACHED, PD_T_DRP_SNK=
);
> >               break;
> >       case SRC_ATTACH_WAIT:
> > -             if (tcpm_port_is_debug(port))
> > +             if (tcpm_port_is_debug_source(port))
> >                       tcpm_set_state(port, DEBUG_ACC_ATTACHED,
> >                                      port->timings.cc_debounce_time);
> >               else if (tcpm_port_is_audio(port))
> > @@ -5434,7 +5439,7 @@ static void run_state_machine(struct tcpm_port *p=
ort)
> >                       tcpm_set_state(port, SRC_UNATTACHED, PD_T_DRP_SRC=
);
> >               break;
> >       case SNK_ATTACH_WAIT:
> > -             if (tcpm_port_is_debug(port))
> > +             if (tcpm_port_is_debug_sink(port))
> >                       tcpm_set_state(port, DEBUG_ACC_ATTACHED,
> >                                      PD_T_CC_DEBOUNCE);
> >               else if (tcpm_port_is_audio(port))
> > @@ -5454,7 +5459,7 @@ static void run_state_machine(struct tcpm_port *p=
ort)
> >               if (tcpm_port_is_disconnected(port))
> >                       tcpm_set_state(port, SNK_UNATTACHED,
> >                                      PD_T_PD_DEBOUNCE);
> > -             else if (tcpm_port_is_debug(port))
> > +             else if (tcpm_port_is_debug_sink(port))
> >                       tcpm_set_state(port, DEBUG_ACC_ATTACHED,
> >                                      PD_T_CC_DEBOUNCE);
> >               else if (tcpm_port_is_audio(port))
> > @@ -6360,10 +6365,10 @@ static void _tcpm_cc_change(struct tcpm_port *p=
ort, enum typec_cc_status cc1,
> >
> >       switch (port->state) {
> >       case TOGGLING:
> > -             if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) =
||
> > +             if (tcpm_port_is_debug_source(port) || tcpm_port_is_audio=
(port) ||
> >                   tcpm_port_is_source(port))
> >                       tcpm_set_state(port, SRC_ATTACH_WAIT, 0);
> > -             else if (tcpm_port_is_sink(port))
> > +             else if (tcpm_port_is_debug_sink(port) || tcpm_port_is_si=
nk(port))
> >                       tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
> >               break;
> >       case CHECK_CONTAMINANT:
> > @@ -6371,9 +6376,11 @@ static void _tcpm_cc_change(struct tcpm_port *po=
rt, enum typec_cc_status cc1,
> >               break;
> >       case SRC_UNATTACHED:
> >       case ACC_UNATTACHED:
> > -             if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) =
||
> > +             if (tcpm_port_is_debug_source(port) || tcpm_port_is_audio=
(port) ||
> >                   tcpm_port_is_source(port))
> >                       tcpm_set_state(port, SRC_ATTACH_WAIT, 0);
> > +             else if (tcpm_port_is_debug_sink(port))
> > +                     tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
> >               break;
> >       case SRC_ATTACH_WAIT:
> >               if (tcpm_port_is_disconnected(port) ||
> > @@ -6395,7 +6402,7 @@ static void _tcpm_cc_change(struct tcpm_port *por=
t, enum typec_cc_status cc1,
> >               }
> >               break;
> >       case SNK_UNATTACHED:
> > -             if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) =
||
> > +             if (tcpm_port_is_debug_sink(port) || tcpm_port_is_audio(p=
ort) ||
> >                   tcpm_port_is_sink(port))
> >                       tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
> >               break;
> > --
> > 2.34.1
>
> thanks,
>
> --
> heikki

