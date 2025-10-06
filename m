Return-Path: <linux-usb+bounces-28938-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C80CBBFCC5
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 01:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0D063C45C4
	for <lists+linux-usb@lfdr.de>; Mon,  6 Oct 2025 23:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366C12147EF;
	Mon,  6 Oct 2025 23:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mxUSdsPr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242014C9D
	for <linux-usb@vger.kernel.org>; Mon,  6 Oct 2025 23:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759794801; cv=none; b=rThZhMLEYOfvv3S3SDg1BxDRlpBziQjfsjBPdmrs68YATE108YirsZEptyTBV8JojGPFqjsE0MtckstsGeCwQok5tvufzdnS41HvwFgBgXMRAKozP3+C+jKSX72AwM4Hup2ts7PjGxOi2Ob5CUNsk4eGiaXybsWip44/Pia2uE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759794801; c=relaxed/simple;
	bh=6XqDELyfzc8ahFNCXbL30AYuWogbDZwVn2GuCbcRMbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TrwiLh1BdOAuXw1hDm6iJbqJph3R3E9bclXhcU1sHWxTCRjeXvx8cQYBnNM3EDX01bCj3Oxe3LwlFViOkcB8wEGFONIkojuQVw0JjGZiBh+jIOFgD2akZz4fo0AyQvSQ8N2ldgq0hwgL6jI4fP9CYpwt+1Ixys36h9XbjUfxcbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mxUSdsPr; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-43f696ebf8eso1365249b6e.0
        for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 16:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759794799; x=1760399599; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghI0a0kRzT954YyKzuf4DuMpgOs7az5knEvnHGslLcg=;
        b=mxUSdsPrd35ksslWwapshflVSfWF2oNmVO9oK+JnByQG4krxHgid0ew4MUlU9je99A
         gjj/iK1ZGCU/Lz6wxJdhRAFy67QE+fBEquOTYnI7L5ndDQY8mzbUpgpRvm+N62ZbKqfE
         Rukydkb/RJOV4OAdA2snAooNm6Q5mzcFxL38kSK5PoMkIlkRPQu4desXZd5RzEJ5mA3u
         jfIUR8MRY4hr44Mb4e1nOVV0TLBfurNyv0+EzCUDSSrkrxUekr6NhnC8d8k4EF+IFi/Q
         3SA4bukFilPbzhPm2IgPYfPNbYR9ifDalMJa/AKygDNv2TWHyWs7FkdDMGGoKrcjaaEC
         rgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759794799; x=1760399599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ghI0a0kRzT954YyKzuf4DuMpgOs7az5knEvnHGslLcg=;
        b=OmGZWUPAiuXqsGQqVbRTeaLTY1OLFTpiEUFISSfbKzdlWVYCP2w0EbVa1Us4gBxNWO
         94X63PS6PSyPc95dVY9Gdlkx//JwI30hIKDLiela1KiHvlOP5FDCmX6qGn03OOAFp5Q6
         S/1k2ShDUtuoRKPq4UhlPI6Va12c9Cw14xGooa1CE6q9tZx6H0374EWwB1nxfPUMQWXd
         HmuLR093GowTX1+LnWDVaB0s1e10DUQC4tYmTX10s2wEuN3b9Bp4k3ynbb9pKegf1wc9
         q/Zswii++t+X/3yxrpmG+7McstAGkggwZ7vQlH63+SKBtoOz7gRv9+4xv4DBtOal/b2/
         bk/w==
X-Forwarded-Encrypted: i=1; AJvYcCXXHSs2VI8QZVDg3e4PzjAfD+dPOXaK9e0Ssc28fQXYJ/SU1h7pWbsChn81YZySnrWC3m3wOFWf6Vk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAefRHCTGXv7agoPHE0DrpKrpcpuoPY1NU3KMEnGCE0d1fhI3i
	lCpyJf1FWQRiQhtaJcWnyfkPFN+4vwGg0T2IRcWMzo5lhc5AFvUy8VqzJaczYW4C9OZAxCExFdj
	nvUYSw3o8tbJDuFwRU6rYzu4snILIYMwVEc887VLb
X-Gm-Gg: ASbGnctUc7fH5P0dImcO3g6etPppGCs1awbPpMIfC6Sew/sTu3eH2lDJVjSEYh+c8ch
	5vh27fYlT9YCoLbINjvQ6ADlvFVyeI+RhOw6zB+YaFG6h4bbqLg4TxYZqnGssa6X63dq3hyg75u
	daTpgETORpy8ePU57ae2BfxtouetE8+0x1NrRnMQ5LYNJ6InawSaMOWqnrBBobHpAo5CfG4vSSI
	e2ge09+k4Fsu3TnWsJ7pNdeECbHhnNIxepnwEWCXUDxy1eBqD76yQ2nqoCl56836FIN
X-Google-Smtp-Source: AGHT+IGICKV72o+Vw/GaLGruC3bnYHj+/BHJwYeTf0ZghFaJEpn5aCaBfMNO2dLMSshOQUNNDOcahStBsjIW0D8pORQ=
X-Received: by 2002:a05:6808:3508:b0:43f:3d56:4dad with SMTP id
 5614622812f47-43fc1861a61mr6740307b6e.38.1759794798847; Mon, 06 Oct 2025
 16:53:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251003-b4-ml-topic-tcpm-v1-1-3cdd05588acb@pengutronix.de> <CAPTae5Jn_visQUHaHvb2yXZdBhFySz+24TJuY8uyVB1v7tVisA@mail.gmail.com>
In-Reply-To: <CAPTae5Jn_visQUHaHvb2yXZdBhFySz+24TJuY8uyVB1v7tVisA@mail.gmail.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Mon, 6 Oct 2025 16:52:42 -0700
X-Gm-Features: AS18NWC1yp_E9V7b0FT70OhaQMhvF6rVBflQ-_l0DHsNB0E85nSqGyvB09tyywY
Message-ID: <CAPTae5+qMTg3t4_D8Yp=TihnBmUVvQz-4OrytE8rgJ4=MF4R6g@mail.gmail.com>
Subject: Re: [PATCH] tcpm: switch check for role_sw device with fw_node
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@pengutronix.de, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hans de Goede <hdegoede@redhat.com>, jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 6, 2025 at 4:45=E2=80=AFPM Badhri Jagan Sridharan <badhri@googl=
e.com> wrote:
>
> .
>
> On Fri, Oct 3, 2025 at 3:34=E2=80=AFAM Michael Grzeschik
> <m.grzeschik@pengutronix.de> wrote:
> >
> > When there is no port entry in the tcpci entry itself, the driver will
> > trigger an error message "OF: graph: no port node found in /...../typec=
" .
> >
> > It is documented that the dts node should contain an connector entry
> > with ports and several port pointing to devices witch usb-role-switch
>
> s/witch/with
>
> > property set. Only when those connecter entry is missing, it should
>
> s/connecter/connector
>
> > check for port entries in the main node.
> >
> > We switch the search order for looking after ports, which will avoid th=
e
> > failure message while there are explicit connector entries.
> >
>
> Missing Fixes: tag ?

Also please Cc: stable@vger.kernel.org.
ref:https://www.kernel.org/doc/Documentation/process/stable-kernel-rules.rs=
t

>
> > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> > ---
> >  drivers/usb/typec/tcpm/tcpm.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcp=
m.c
> > index b2a568a5bc9b0ba5c50b7031d8e21ee09cefa349..cc78770509dbc6460d75816=
f544173d6ab4ef873 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -7876,9 +7876,9 @@ struct tcpm_port *tcpm_register_port(struct devic=
e *dev, struct tcpc_dev *tcpc)
> >
> >         port->partner_desc.identity =3D &port->partner_ident;
> >
> > -       port->role_sw =3D usb_role_switch_get(port->dev);
> > +       port->role_sw =3D fwnode_usb_role_switch_get(tcpc->fwnode);
>
>
> Seems to be a reasonable thing to do esp. given that bindings
> documention mentions that port/ports node is part of connector
> class:https://github.com/gregkh/linux/blob/master/Documentation/devicetre=
e/bindings/connector/usb-connector.yaml#L189.
>
>
> Adding hdegoede@, jun.li@ as they submitted patches for USB role switch i=
n tcpm.
> hdegoede@, jun.li@ Please let us know if there are any concerns from
> your side regarding accepting this patch.
>
> Thanks,
> Badhri
>
>
> >
> >         if (!port->role_sw)
> > -               port->role_sw =3D fwnode_usb_role_switch_get(tcpc->fwno=
de);
> > +               port->role_sw =3D usb_role_switch_get(port->dev);
> >         if (IS_ERR(port->role_sw)) {
> >                 err =3D PTR_ERR(port->role_sw);
> >                 goto out_destroy_wq;
> >
> > ---
> > base-commit: e406d57be7bd2a4e73ea512c1ae36a40a44e499e
> > change-id: 20251003-b4-ml-topic-tcpm-27146727d76a
> >
> > Best regards,
> > --
> > Michael Grzeschik <m.grzeschik@pengutronix.de>
> >

