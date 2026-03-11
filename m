Return-Path: <linux-usb+bounces-34610-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0M8MMJ26sWmxEwAAu9opvQ
	(envelope-from <linux-usb+bounces-34610-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 19:55:25 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E633268EDC
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 19:55:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08DCA3046BB8
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 18:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9FDF3EC2C4;
	Wed, 11 Mar 2026 18:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bECnSL7+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6FA3E9F7B
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 18:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773255311; cv=pass; b=nj7hZJ6i259M/YFHwlUPTwYqrJ0/k5XTwPEz5w9PJbc4H448qwE2ieKsefpPJNprOwipIUJa37y9wnuiR/7ID6QcuYrXUn1FPvTS/3rruzKUgdJ0XFwrzNWTsx4elxXpvjCpBRZi+DRvAuRe0L3iHooJ5KWcquaGRDxt7451wR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773255311; c=relaxed/simple;
	bh=irxwBx6UP69oFnPVwuxdcfosSKIVNRJAx/pAMZWSGhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZUj1sMXCqayfSje0vXkNTEWa1e8bhAE3X+5i+vyRRx5i9a6OTXtU3zovJfW/LNXFUYWwhdbNQ2QpXsjHtwLVMyPm4q5BslVG1a+uITLF+LvzqT8CBQ1+8Bu2PlBsv+Nz33rk2Fs0cjq4xzlxG77pLJXdL+B/qIgJYDR09XYtTpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bECnSL7+; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b972641eb96so18073866b.2
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 11:55:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773255307; cv=none;
        d=google.com; s=arc-20240605;
        b=OtTiwOx2qxMB4wXxN6PtIc2msdYn1td9pDsmVnCfAKLen3IkTIbIt1mYjgq1EJSFZ4
         wO3IGUhOE4VPRDDDi2PLTcokCW9lHgAVB2Lk9INM/oWnFzVDcO3I1dXkTpX2cMW2vVRj
         79kxXK5VK9kjqs6VeWK7MFxLjkL1Ng0JiyajN8DEWQtg4sWzYNi9AkKxHRYW+wI+f8bI
         /b6fcdSlw63hVv/sl/83ctBM+scZqETwcgBeFANFh46PUuLSmaGUc0Slox/3HvrpTolO
         R5uMzkYwpBTPuP7qEDwPRi56dWwWbbc88T7pQOH8urrGccTNSQeMjrtVdlUvNWNSKhuB
         s9SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hHaBAq1X6Cs9R/WovG2TDPIdkyxlD9U7dFf+lUqKaZ0=;
        fh=a6Xg72lGPrLniNC3He8jOrQnSkqOKhfz+gV6S8KWLFg=;
        b=TZji/Fh7pguUfhTxF6lpChEcKxZYBiT4ZdhvWIex2FIz7Syu1soh8Lt3mZVqiggKmI
         z+i+h5s2unG/X/pS3Czbihn/g4aRljquvHKq8J5QWlCGQFcHGkqfatg6iLeQblLf9hTK
         fzmusigvG8Ji5cd76RkhUfdfnmYQrlUKpLzeeZo12mJFnXSbIBLMPQDnRcRsptuRFfgU
         c5J0OzjCDg9QJ63pFgudRoxmP9mnd9AygVvv4lPgCkAWpCUVSIOIIzUnVlVc05c3lVdK
         IjKL0ieQNwBqS//0npIRBCOP1S0k/eeLYNlsigGtXeV3LUjd97XQ6qz3fbj7+9AsDC7m
         YgSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773255307; x=1773860107; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHaBAq1X6Cs9R/WovG2TDPIdkyxlD9U7dFf+lUqKaZ0=;
        b=bECnSL7+eP9KFKgOMAqfs2V0+7MyCvE+Fa0vmsxxUjc20FzB8I8Hj6vrfTJjGaKPAX
         Djg9nbqWr2nsP3+yZwzMbSUbU8wBVxrpPfDTDdExD5qHDBVBCh+FcvxOaTquYtVEuqfg
         QmL2iVUdTmAcM66JCsxyzcADK8Lxun93awA1IoeJEz0sqONjOvslr/Tj6qeYN3d7CJoV
         y+/XyEzW4YuAqqjRPoV8PRfuDSyIaFwMECmC7QUYOpwotHF0D0miq2t/gYSOlf1HTtkv
         KPSZ39isQLTl7beC1Iqfxwaxj1j+Nu686iypeeBblPCeLQG/og+fy8OFKVha7cCpKKVG
         9UGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773255307; x=1773860107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hHaBAq1X6Cs9R/WovG2TDPIdkyxlD9U7dFf+lUqKaZ0=;
        b=oikmRjYyVVRmh1tkcjs1Xdz4ayhglj1UR1wyLydER80MyGeph6fXy2K03TLBnJ9r3N
         BCdDz61geH5EZvIfaerq8qY1Lz1sBjTcAPXBZPPO6JvGYoGA/RvXb4461DlX1uudKKng
         +8llqUXqK7mAd2CjVDP3kdd8hk8H+dlSFh7hXapGISuUIh7Jk+32X0A2PJsFdCPSwbN+
         B9HpScdT7OpuwDV+WjfbW9K4Ha9tOb4NxBxSuAvWwqAeMZI/4eeTS98fJO1ZNM3wMFiT
         kXHe7YWcpmgb1nHVozd654a6vhc+hB13BFb0CjEow3Hy2QQx6v8VOi5QWL+gO7K00Sfx
         rrEg==
X-Gm-Message-State: AOJu0Yx6/31SdfXyIm29iSf9a1kgqfXkQNVHTqz7xmXMg0SviLek9mch
	HPol0mcBjyADw0EzqdECH3SiedGhp01HiE3wj+u2W6swCzRjEv2yxGvVtgOw31hbxtkVGzMlKBu
	GrO1zMzir5kn47xBfvI4IxMsjKyFReK0=
X-Gm-Gg: ATEYQzzwEEUiXfDlPZ6UUGQ8gbtzc1UL7gtQenQVmzQh8I3ES89ldgC143C+1SQ3nzi
	qm6Q1ceUqdVgGZc4rvCBMGKGEIGN4EQm9+dAYltG3hB6JWnfZXRDVV2rOCs0492vVU0pTR4bGni
	SGXppW4+fpCZTgzhvFu7BcKiPqFQRencLIcbKTBsl+BT3fffLPwHh0M80jCTStjGAcRo2Uyt2pQ
	KpX2gcBSmzIqJp2UXrSGnJBPMadVaqcxOFhGNK6Sa1Mp/ZxRtE3TLHELLAeKo9aJqnYZrfBKpsr
	Z7bK/l0mS5PysI+BP3xcR1/v3Tg/7iPz0V3eQz1kJN6vDtx7Xb3zcuelTtJowFoob9H2Jaer1x4
	kSEtDZcxnpJEXp5vB
X-Received: by 2002:a17:907:980f:b0:b73:544d:b963 with SMTP id
 a640c23a62f3a-b972e1fb818mr215294466b.13.1773255306700; Wed, 11 Mar 2026
 11:55:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306222148.8200-1-rosenp@gmail.com> <2026031127-siding-caress-7ed9@gregkh>
In-Reply-To: <2026031127-siding-caress-7ed9@gregkh>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 11 Mar 2026 11:54:55 -0700
X-Gm-Features: AaiRm53qW5bk3kKh7rdlWXHeQ5YAkvINL-7BQnfjicz7nmTpcD6zasMPluist-A
Message-ID: <CAKxU2N_dJY60Tp4UgLMZ97ZJywNEktmA1At3z6VOPhhSCRx-1w@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: qcom-pmic-typec: simplify allocation
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"open list:QUALCOMM TYPEC PORT MANAGER DRIVER" <linux-arm-msm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34610-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,checkpatch.pl:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1E633268EDC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 7:47=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Mar 06, 2026 at 02:21:48PM -0800, Rosen Penev wrote:
> > Change kzalloc + kcalloc to just kzalloc with a flexible array member.
> >
> > Add __counted_by for extra runtime analysis when requested.
> >
> > Shuffle some code in probe to provide a clearer picture.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  .../typec/tcpm/qcom/qcom_pmic_typec_pdphy.c   | 27 ++++++++-----------
> >  .../typec/tcpm/qcom/qcom_pmic_typec_port.c    | 26 ++++++++----------
> >  2 files changed, 22 insertions(+), 31 deletions(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/driv=
ers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> > index c8b1463e6e8b..4b3915c6894a 100644
> > --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> > +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> > @@ -95,13 +95,13 @@ struct pmic_typec_pdphy {
> >       struct regmap                   *regmap;
> >       u32                             base;
> >
> > -     unsigned int                    nr_irqs;
> > -     struct pmic_typec_pdphy_irq_data        *irq_data;
> > -
> >       struct work_struct              reset_work;
> >       struct work_struct              receive_work;
> >       struct regulator                *vdd_pdphy;
> >       spinlock_t                      lock;           /* Register atomi=
city */
> > +
> > +     unsigned int                    nr_irqs;
> > +     struct pmic_typec_pdphy_irq_data        irq_data[] __counted_by(n=
r_irqs);
> >  };
> >
> >  static void qcom_pmic_typec_pdphy_reset_on(struct pmic_typec_pdphy *pm=
ic_typec_pdphy)
> > @@ -560,31 +560,26 @@ int qcom_pmic_typec_pdphy_probe(struct platform_d=
evice *pdev,
> >       struct pmic_typec_pdphy_irq_data *irq_data;
> >       int i, ret, irq;
> >
> > -     pmic_typec_pdphy =3D devm_kzalloc(dev, sizeof(*pmic_typec_pdphy),=
 GFP_KERNEL);
> > -     if (!pmic_typec_pdphy)
> > -             return -ENOMEM;
> > -
> >       if (!res->nr_irqs || res->nr_irqs > PMIC_PDPHY_MAX_IRQS)
> >               return -EINVAL;
> >
> > -     irq_data =3D devm_kcalloc(dev, res->nr_irqs, sizeof(*irq_data),
> > -                             GFP_KERNEL);
> > -     if (!irq_data)
> > +     pmic_typec_pdphy =3D devm_kzalloc(dev, struct_size(pmic_typec_pdp=
hy, irq_data, res->nr_irqs), GFP_KERNEL);
>
> extra long line, checkpatch.pl didn't complain about this?
>
> > +     if (!pmic_typec_pdphy)
> >               return -ENOMEM;
> >
> > +     pmic_typec_pdphy->nr_irqs =3D res->nr_irqs;
> > +     pmic_typec_pdphy->dev =3D dev;
> > +     pmic_typec_pdphy->base =3D base;
> > +     pmic_typec_pdphy->regmap =3D regmap;
> >       pmic_typec_pdphy->vdd_pdphy =3D devm_regulator_get(dev, "vdd-pdph=
y");
> >       if (IS_ERR(pmic_typec_pdphy->vdd_pdphy))
> >               return PTR_ERR(pmic_typec_pdphy->vdd_pdphy);
> >
> > -     pmic_typec_pdphy->dev =3D dev;
> > -     pmic_typec_pdphy->base =3D base;
> > -     pmic_typec_pdphy->regmap =3D regmap;
> > -     pmic_typec_pdphy->nr_irqs =3D res->nr_irqs;
> > -     pmic_typec_pdphy->irq_data =3D irq_data;
> >       spin_lock_init(&pmic_typec_pdphy->lock);
> >       INIT_WORK(&pmic_typec_pdphy->reset_work, qcom_pmic_typec_pdphy_si=
g_reset_work);
> >
> > -     for (i =3D 0; i < res->nr_irqs; i++, irq_data++) {
> > +     for (i =3D 0; i < res->nr_irqs; i++) {
> > +             irq_data =3D &pmic_typec_pdphy->irq_data[i];
> >               irq =3D platform_get_irq_byname(pdev, res->irq_params[i].=
irq_name);
> >               if (irq < 0)
> >                       return irq;
> > diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drive=
rs/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> > index 8051eaa46991..7c5cf8061f04 100644
> > --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> > +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
>
> Can you just convert one driver at a time please?  This should be a
> patch series.
This is not the same driver?
>
> thanks,
>
> greg k-h

