Return-Path: <linux-usb+bounces-8714-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 826B1894EF7
	for <lists+linux-usb@lfdr.de>; Tue,  2 Apr 2024 11:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1D061C22A61
	for <lists+linux-usb@lfdr.de>; Tue,  2 Apr 2024 09:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54EE358ABC;
	Tue,  2 Apr 2024 09:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y88qm0nR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CEC58211
	for <linux-usb@vger.kernel.org>; Tue,  2 Apr 2024 09:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712051238; cv=none; b=sO2ElQRdfJUTGhR2PpHauUellpAL24F1xLOVK4FU3WMwSfE/tlS2MQz3xvqDm1820XXDKS91UrEHBUBJslCoj5WrlXAYDfplgXID8fg+++lKE63cxaSdnpfniSOAPxLItwRZyntAxKBHLNbXloxC/zV0BzHDgPi+YJJbTXN2TFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712051238; c=relaxed/simple;
	bh=TJDrCNXo+8+7H7fAKmYwt7LDCJ7der/4q66vrT/nPic=;
	h=From:Message-ID:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PLVP+c+mWeTlbjVVb5H1Ekr/TItLnxNKFu8V9oEwSCH9qrBLbnxIciVUlykyB9o1iFFIq5aF+aGVU/JRHFPwWSsYUy+Yhh2sSFjDV2UEwmT7A9CRf1L9haBHqD6bduMhbt/IHvg0v41PpvWcrPmPEX45Svc/ws5EbJA/iO+Bp1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y88qm0nR; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-56bc5a3aeb9so6280265a12.3
        for <linux-usb@vger.kernel.org>; Tue, 02 Apr 2024 02:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712051236; x=1712656036; darn=vger.kernel.org;
        h=user-agent:mime-version:date:content-transfer-encoding:face
         :references:in-reply-to:cc:to:subject:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJDrCNXo+8+7H7fAKmYwt7LDCJ7der/4q66vrT/nPic=;
        b=Y88qm0nRLoI0bU51OZwVfbKUOAlqtfZGyLWnmPmNYeNbqiFvM1RAoqNJqFMigEd4+f
         xPmkp0DG/EUTyDsHYo3Xbve0kr+AuA3FXoNtHZ46vRRfFFWsq2viY8eUuzzfXwhymOEV
         MntbBdVeck/3ifmICRmsjA6h+v4scxW0sQyMeh5Lg0CDcUwy1owdXptyZJAx+9AF529p
         q4LjaEqQnyjJQ+DZompwzwqYQ1N77GVjOUWzqshccp//nuVyYlPPKMGK84clbs6RBX9a
         sKBSzGeqNjRZujMAYml7tCCUAPQQG2wParEdzr3E3H8Bc5nREKoXfqs/dDif1wxhqIEn
         6v9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712051236; x=1712656036;
        h=user-agent:mime-version:date:content-transfer-encoding:face
         :references:in-reply-to:cc:to:subject:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TJDrCNXo+8+7H7fAKmYwt7LDCJ7der/4q66vrT/nPic=;
        b=dBBS99AaO+KoXSezft1oBgyviJ4zw3QXwH/zvJ8fFG3kJxOtX2E2HC65jW/qPyU19T
         2pEPKyYElRkuv0BU6eaeR+G77EJgiIUrsQOyOJj2zf2eGAOXTR0l26BnFePt3hTynTQ0
         gEiOufh8hcHKAvgE3thH31kDtePIS2lzHoN6M60HdQEAQu9SvZAhiLt9Lagxj0SJuvot
         ZaMlReMWLfuNVT4UW3EEqxCQG9qhlGZ4xZk7DWHuMn++LXtozDSZmuXH0Su3VaGM9MZQ
         4drriOp6tu9bxQVdZtNgod97ypXkQw2L6qtdqOH5KbgfB5m1HAJN6Z4VtVP4r/2Nr8nd
         /2UA==
X-Gm-Message-State: AOJu0YzqKjPaCJ1t50NainCrBsgsRkSVxtLJD+plq+mTmAt5Ve/dzc37
	EO5mZiLjjDjkZMh9kGE1kFiJmLg+oFHMfEhk8R30FIttiURrmNSn
X-Google-Smtp-Source: AGHT+IFjE2kgOq//gFAmFKzvdTjtICXJkCCnnXpx/92Cy1PkDT6LMxszo/a1oLq+bwPefvv/TsdI/A==
X-Received: by 2002:a05:6402:2743:b0:56c:5990:813d with SMTP id z3-20020a056402274300b0056c5990813dmr9090890edd.21.1712051235382;
        Tue, 02 Apr 2024 02:47:15 -0700 (PDT)
Received: from gentoo (dynamic-2a01-0c23-8920-2900-2e44-fdff-fe2e-d02c.c23.pool.telefonica.de. [2a01:c23:8920:2900:2e44:fdff:fe2e:d02c])
        by smtp.googlemail.com with ESMTPSA id r1-20020aa7cb81000000b0056dd4bf7660sm2181677edt.52.2024.04.02.02.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 02:47:14 -0700 (PDT)
From: Massimo Burcheri <burcheri.massimo@gmail.com>
X-Google-Original-From: Massimo Burcheri <burcheri.massimo+linux-usb@gmail.com>
Message-ID: <3ede73e9c958386180f47e52be80f451b3daa721.camel@gmail.com>
Subject: Re: JMicron JMS567 and UAS
To: Alan Stern <stern@rowland.harvard.edu>, Oliver Neukum <oneukum@suse.com>
Cc: linux-usb <linux-usb@vger.kernel.org>
In-Reply-To: <fc10752f-5b63-4aed-805e-3e60e8e18e48@rowland.harvard.edu>
References: <5d8cad13445172d02a371f162ceaea1a68819819.camel@gmail.com>
	 <a5b48a53-9dff-4a84-9a58-1c08f0e0781b@rowland.harvard.edu>
	 <072417fd7806d86e930bccb882460dbbfaa5ca52.camel@gmail.com>
	 <0919e02b-e395-438c-b4d6-314d7e108639@rowland.harvard.edu>
	 <7f8396ae597a78969811011034a7e5f759a6564e.camel@gmail.com>
	 <c3cd0de5-e8f3-4edb-bcaa-abf29ce5928b@suse.com>
	 <fc10752f-5b63-4aed-805e-3e60e8e18e48@rowland.harvard.edu>
Face:
 iVBORw0KGgoAAAANSUhEUgAAADAAAAAwAQMAAABtzGvEAAAAA3NCSVQICAjb4U/gAAAABlBMVEX///8AAABVwtN+AAAACXBIWXMAAA7EAAAOxAGVKw4bAAABGUlEQVQYlUWQsUoDQRCGv71LjB7KSSBwwZCTgFhY2EYIHmJnZRMLo5AXUMRCBMHcE6iPoGBlINpoZXGVeQTFKqSxMgYtTBFcZw7EKfZn2Z2Z7//hr2ysZ+5tqFLmWKVaKKs0vWd9TJx2AibmoQcupj6CCZirqTgzA5hmsdtQWe5/xAREX7uJ3MLP9x4lyieNO5mcOxyM8HH79y/4Cdn9R3JDsts/uGO82yOMJf/ah1Y8tfQEIQt7Z7rCawtNiUpHFgYUdgTxgI1NAW6SvxoqWabbw0Bd5jpQibTNBC1F4nIMk2TWhTqIs+fSVpzfCsVR9eaiJf5W6mtWXK7O+vKR4nWkSYSuFbP4No3Ht6dpSN9pSMYmaXI1/usXT0FM3SoTKAAAAAAASUVORK5CYII=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Apr 2024 11:47:11 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.50.2 

On Mon, 2023-10-16 at 15:05 -0400, Alan Stern wrote:

> It showed that his device's current firmware does not support UAS.=C2=A0 =
So=20
> it won't work at very high speed without a firmware upgrade.

I hate installing firmware from inofficial sources...
Too bad, I tried some firmware from
https://www.station-drivers.com/index.php/en/component/remository/Drivers/J=
micron/JMS567-Sata-USB-3.0-Controller/Jmicron-JMS-567-Firmware-Version-20.0=
6.00.01/lang,en-gb/

First, the flashing looked good and said, the device needs a restart.
After a device restart, the device isn't shown in the hardware list anymore=
,
broken forever?

I did not find any official firmware from Orico or JMicron.

Best regards,
Massimo



