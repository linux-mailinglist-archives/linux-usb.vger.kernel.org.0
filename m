Return-Path: <linux-usb+bounces-13592-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B74C69560C8
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 03:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F52C1F2231C
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 01:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E3981BC20;
	Mon, 19 Aug 2024 01:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GjVk7vVO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0062F1BDE6
	for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2024 01:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724030194; cv=none; b=qBItRfsL6t6gCWwyiSHOhgGPavKa2mBKHm4TxZoUz+1xbfSPCau4kWi6T5lNW5p01x9meKEEanoFpKv6nAo7x2NK52PgiweO654t2NkAAx03NTpZfPmG+xMwEgEt6JPEKbHI6SuqcgUPv6joKmgpP+FQSWb3xH3eS2ayMyGoRBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724030194; c=relaxed/simple;
	bh=xhcng5MzljL+XELseiKtxkLrtjUCIkGMzpR+W/AjuHo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=VI52FQHADkgf6nTvVx1W8pol1CgsASYYreosOWMiF3UDp2+MwZ2qmCJwiwbo7/3nFDTWVIZmo8JmueOn4ubtjlM0RQO0b5lPtbNGdwT7ItgTBKRsBlh7lrtSMVluzeGZz9whpjLvQ+rd4FEjuXhyxSCi2IaaUF8mGJFsG+RBgHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GjVk7vVO; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7c3ebba7fbbso3039015a12.1
        for <linux-usb@vger.kernel.org>; Sun, 18 Aug 2024 18:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724030192; x=1724634992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=96bRgenJ1LT1YAwkODeJ5weecL8b0jZhBJFXT0lV/4U=;
        b=GjVk7vVORz8CBYSt0i3/qVJby3TOFlQcxpjYMhcsPfrtkdbYvB4bEGpYpMLnLziqZ3
         9QQz0Ft7NMvFSeyQszO6szE3Quo0Y7eTpS3rtCr9/L00r6oZpkLijXKTzQTMse373R6j
         YWqFkCA/2wQJMaXMjGR09yYSq2sgUSwVAxHBKOQZnAHHvqjF//YQjyVm6FrmHzRNgurb
         KCf9iycEOEmUmhQYcOSEhdjuxqEPBieK8vJ3F4y+4f8ljrWSU0F+wEefj08ZIJWPdXFY
         J9TIN5kWeDi6Eyk0n6fXave0h/rqSAWMXOpAFsikYIBGcdT+Or5VpY8sFsdhkLnQkMZY
         FyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724030192; x=1724634992;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=96bRgenJ1LT1YAwkODeJ5weecL8b0jZhBJFXT0lV/4U=;
        b=Tbax015wqlFAnE8M3J/S4frNSsgXbCJ+SEHvIjhyIpYGs2NZiTfQfSez1Cf6zshMJJ
         xXZbB/XKV2hJbIVXiBnhrbbxFYoq6WdKwIdqtlIBAnKMab+OJx6rW2Tzd0N5kpD5HByd
         2MSKYB63Z3ILjeDW+MnekeKudcEno88PqJbD289fWp0JI5fH6msPH19RC2p1AMSsiYr3
         +Vn7UZsiePkNwTQO+HX3vlzRmMrvrLk9345YC6M02Ds3UqLwCQSeuBiIdmNsklVU/4Y2
         HL1OTqUkJIUxrlCD4Hk7oFYpLNfGDmkG+YrFJ1IDMsJtYEcf4cpZou7q8c52rdEeafNP
         7X6g==
X-Forwarded-Encrypted: i=1; AJvYcCVaLdP0vPXGIHoIgQ24llCg8nwdKM/EVh5fkRy1/bpLn2K4b96gdgr1sjUJ2iRk39H1hvNFvx8CbHp+371V1PK+ZQVkaAPoIbbh
X-Gm-Message-State: AOJu0Yx1gNjtDst2bo220T8qheCINwkIDoqPisdHM6CoKXZXyWPTHQ2Z
	RjY6ooEE0TTS0sT/mDTJ/P/nlonoftyqtk1HvdMJnllnRJ1EffjEEeQSUf6LN2U=
X-Google-Smtp-Source: AGHT+IHcVgjWV8mpMJHnmx32G8QnRgUQIlumrcs85ZM34xvrN4Jh1Evor+hnrJi84mm9FQwpiFjahQ==
X-Received: by 2002:a05:6a20:6f96:b0:1c4:2573:d197 with SMTP id adf61e73a8af0-1c9050477afmr12993409637.35.1724030192131;
        Sun, 18 Aug 2024 18:16:32 -0700 (PDT)
Received: from [127.0.0.1] (node-bmc.pool-118-172.dynamic.totinternet.net. [118.172.58.212])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127add68b9sm5920152b3a.19.2024.08.18.18.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2024 18:16:31 -0700 (PDT)
Date: Mon, 19 Aug 2024 08:16:25 +0700
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
CC: Johan Hovold <johan+linaro@kernel.org>, Chris Lew <quic_clew@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Amit Pundir <amit.pundir@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/3=5D_usb=3A_typec=3A_ucsi=3A_M?=
 =?US-ASCII?Q?ove_unregister_out_of_atomic_section?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20240818-pmic-glink-v6-11-races-v1-2-f87c577e0bc9@quicinc.com>
References: <20240818-pmic-glink-v6-11-races-v1-0-f87c577e0bc9@quicinc.com> <20240818-pmic-glink-v6-11-races-v1-2-f87c577e0bc9@quicinc.com>
Message-ID: <4F313FA4-C2C7-4BD8-8E42-64F98EACCBA2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 19 August 2024 06:17:38 GMT+07:00, Bjorn Andersson <quic_bjorande@quicin=
c=2Ecom> wrote:
>Commit 'caa855189104 ("soc: qcom: pmic_glink: Fix race during
>initialization")' moved the pmic_glink client list under a spinlock, as
>it is accessed by the rpmsg/glink callback, which in turn is invoked
>from IRQ context=2E
>
>This means that ucsi_unregister() is now called from IRQ context, which
>isn't feasible as it's expecting a sleepable context=2E An effort is unde=
r
>way to get GLINK to invoke its callbacks in a sleepable context, but
>until then lets schedule the unregistration=2E
>
>A side effect of this is that ucsi_unregister() can now happen
>after the remote processor, and thereby the communication link with it, i=
s
>gone=2E pmic_glink_send() is amended with a check to avoid the resulting
>NULL pointer dereference, but it becomes expecting to see a failing send
>upon shutting down the remote processor (e=2Eg=2E during a restart follow=
ing
>a firmware crash):
>
>  ucsi_glink=2Epmic_glink_ucsi pmic_glink=2Eucsi=2E0: failed to send UCSI=
 write request: -5
>
>Fixes: caa855189104 ("soc: qcom: pmic_glink: Fix race during initializati=
on")
>Cc: stable@vger=2Ekernel=2Eorg
>Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc=2Ecom>
>---
> drivers/soc/qcom/pmic_glink=2Ec       | 10 +++++++++-
> drivers/usb/typec/ucsi/ucsi_glink=2Ec | 28 +++++++++++++++++++++++-----
> 2 files changed, 32 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/soc/qcom/pmic_glink=2Ec b/drivers/soc/qcom/pmic_glin=
k=2Ec
>index 58ec91767d79=2E=2Ee4747f1d3da5 100644
>--- a/drivers/soc/qcom/pmic_glink=2Ec
>+++ b/drivers/soc/qcom/pmic_glink=2Ec
>@@ -112,8 +112,16 @@ EXPORT_SYMBOL_GPL(pmic_glink_register_client);
> int pmic_glink_send(struct pmic_glink_client *client, void *data, size_t=
 len)
> {
> 	struct pmic_glink *pg =3D client->pg;
>+	int ret;
>=20
>-	return rpmsg_send(pg->ept, data, len);
>+	mutex_lock(&pg->state_lock);
>+	if (!pg->ept)
>+		ret =3D -ECONNRESET;
>+	else
>+		ret =3D rpmsg_send(pg->ept, data, len);
>+	mutex_unlock(&pg->state_lock);
>+
>+	return ret;
> }
> EXPORT_SYMBOL_GPL(pmic_glink_send);
>=20
>diff --git a/drivers/usb/typec/ucsi/ucsi_glink=2Ec b/drivers/usb/typec/uc=
si/ucsi_glink=2Ec
>index ac53a81c2a81=2E=2Ea33056eec83d 100644
>--- a/drivers/usb/typec/ucsi/ucsi_glink=2Ec
>+++ b/drivers/usb/typec/ucsi/ucsi_glink=2Ec
>@@ -68,6 +68,9 @@ struct pmic_glink_ucsi {
>=20
> 	struct work_struct notify_work;
> 	struct work_struct register_work;
>+	spinlock_t state_lock;
>+	unsigned int pdr_state;
>+	unsigned int new_pdr_state;
>=20
> 	u8 read_buf[UCSI_BUF_SIZE];
> };
>@@ -244,8 +247,22 @@ static void pmic_glink_ucsi_notify(struct work_struc=
t *work)
> static void pmic_glink_ucsi_register(struct work_struct *work)
> {
> 	struct pmic_glink_ucsi *ucsi =3D container_of(work, struct pmic_glink_u=
csi, register_work);
>+	unsigned long flags;
>+	unsigned int new_state;
>+
>+	spin_lock_irqsave(&ucsi->state_lock, flags);
>+	new_state =3D ucsi->new_pdr_state;
>+	spin_unlock_irqrestore(&ucsi->state_lock, flags);
>+
>+	if (ucsi->pdr_state !=3D SERVREG_SERVICE_STATE_UP) {
>+		if (new_state =3D=3D SERVREG_SERVICE_STATE_UP)
>+			ucsi_register(ucsi->ucsi);
>+	} else {
>+		if (new_state =3D=3D SERVREG_SERVICE_STATE_DOWN)
>+			ucsi_unregister(ucsi->ucsi);
>+	}
>=20
>-	ucsi_register(ucsi->ucsi);
>+	ucsi->pdr_state =3D new_state;
> }

Is there a chance if a race condition if the firmware is restarted quickly=
, but the system is under heavy mist:=20
- the driver gets DOWN event, updates the state and schedules the work,
- the work starts to execute, reads the state,
- the driver gets UP event, updates the state, but the work is not resched=
uled as it is still executing=20
- the worker finishes unregistering the UCSI=2E



>=20
> static void pmic_glink_ucsi_callback(const void *data, size_t len, void =
*priv)
>@@ -269,11 +286,12 @@ static void pmic_glink_ucsi_callback(const void *da=
ta, size_t len, void *priv)
> static void pmic_glink_ucsi_pdr_notify(void *priv, int state)
> {
> 	struct pmic_glink_ucsi *ucsi =3D priv;
>+	unsigned long flags;
>=20
>-	if (state =3D=3D SERVREG_SERVICE_STATE_UP)
>-		schedule_work(&ucsi->register_work);
>-	else if (state =3D=3D SERVREG_SERVICE_STATE_DOWN)
>-		ucsi_unregister(ucsi->ucsi);
>+	spin_lock_irqsave(&ucsi->state_lock, flags);
>+	ucsi->new_pdr_state =3D state;
>+	spin_unlock_irqrestore(&ucsi->state_lock, flags);
>+	schedule_work(&ucsi->register_work);
> }
>=20
> static void pmic_glink_ucsi_destroy(void *data)
>


