Return-Path: <linux-usb+bounces-6937-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E41FB860875
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 02:45:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21DE31C21E42
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 01:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2ADB66B;
	Fri, 23 Feb 2024 01:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ma5DR48l"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BDCB642
	for <linux-usb@vger.kernel.org>; Fri, 23 Feb 2024 01:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708652731; cv=none; b=RA4Mm1pfefhLRA2lN+lfSuqVztRbduvLAcB3lQLM+8DLqCuOcmeJV3/+cMgH4F4YkR+mY2D+x4gBDhRgIk4lan2T7l7wk1qKGp6iXFxPZN4KpYnx6yFke/K2I0GrAkKcHTG/rjAlYK+lbZ6LGa1lVeBp78h87uNlYOJz+ybQH7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708652731; c=relaxed/simple;
	bh=PGBKKekQDAIr5PLM2mn5HBnxWjVPKTfAv9oMhk1apy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xu61CO1wBIxqQnqyqv8TQfw5OYA2lh9MNdD1iGS/PtHGS+ZG49UjRMq9Ccowtu2jZ4AOZsQgixHApzDyK2LpX9QuYoVMotMvkpVb6SqocnwLDWcS8ImN2AqRd9ZxozBTkrMic0l45X9/u6UYG3Tx/nD7dxL9595i5C0vhMXEpFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ma5DR48l; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-7d698a8d93cso180431241.3
        for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 17:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708652729; x=1709257529; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGBKKekQDAIr5PLM2mn5HBnxWjVPKTfAv9oMhk1apy4=;
        b=Ma5DR48lgVE7JbKadSKEXzri8fNpXkNUGfjBge9zzmPS5hEqoUrghlyZMKy6qyAW1L
         K4c5JWaOS6o7ceY4yg2nM2HcJ2Ga/z9FGafh9b6pjahODk8RuUZBgY5WtnmkhJoOAUwC
         dUMoQ010kU6ZCn3OujojLlAc93oSNubBsxsRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708652729; x=1709257529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PGBKKekQDAIr5PLM2mn5HBnxWjVPKTfAv9oMhk1apy4=;
        b=vzOeNFNfdk45GZENqjLWJDM/L/HxjCqCgLF8J0X5G4OWZnnrhpMcpuinU/YhylY3Hj
         G+KuD0+y6CU6/iEpYewHZGP3ZSGZRS2Uo6IPpWlftxq/vAQkp3sftf7/8VEUOQmVHh5T
         sjr54gzAxUYxVBTcnVpCBKqJHTkrwEpuBjUhKHWe48sTBztQaV7WDfQVgs7xxg3837Uo
         FRkOJVaopAQBmc1rIyoapNFcXvdNoRxjWrQBWwVWDjOgVFcdVAuqHpJSTzrZZR/ymLBk
         HZ5wnR/XmlelfK04a2sB8hwMn37v+1T5pOxpZaRp7fLmG/ONwbXIeJLPueX6h5tr3267
         +pHg==
X-Forwarded-Encrypted: i=1; AJvYcCWtYPZFohV+SfRuJKkfWGs9olwU8Xg5rzTeOBSUiCwypCZcInPUYtYc/3fW6fto5iyw2/aB5xeI459y1PGBboZUptr5UWT7sIoW
X-Gm-Message-State: AOJu0Yx1Uh1D0cU3R0IOoXdVG2LtnL1i0TABQNmhYLwKPg6vh1vRGfgw
	1njPPXADUCstwMsU9JrlwsZufcyJCBpgEWRGdFCeEoggDoZ0Co1tlL8AuauJua8mM2BFreNremQ
	aUF+7xcAs6q7/hNgFRtAAjqOdJQnzB1ziDyxW
X-Google-Smtp-Source: AGHT+IGtgjTMZH94I0YCk3sZCfjNaboqkvkZ3DOVoBuD4gPMpclt3jI0DHU+7gjD7HDZz1ZrB0jH2TEPiz/IQvfa2QA=
X-Received: by 2002:a05:6102:f08:b0:470:79b8:9d87 with SMTP id
 v8-20020a0561020f0800b0047079b89d87mr880837vss.25.1708652728968; Thu, 22 Feb
 2024 17:45:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223010328.2826774-1-jthies@google.com> <20240223010328.2826774-3-jthies@google.com>
In-Reply-To: <20240223010328.2826774-3-jthies@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 22 Feb 2024 17:45:17 -0800
Message-ID: <CACeCKafNh6mJb-ukEQF9ces1p4Y0=4-Uokzk817+tMj=TUvKhg@mail.gmail.com>
Subject: Re: [PATCH 2/4] usb: typec: ucsi: Register cables based on GET_CABLE_PROPERTY
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	bleung@google.com, abhishekpandit@chromium.org, andersson@kernel.org, 
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, neil.armstrong@linaro.org, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 5:04=E2=80=AFPM Jameson Thies <jthies@google.com> w=
rote:
>
> Register cables with the Type-C Connector Class in the UCSI driver based
> on the PPM response to GET_CABLE_PROPERTY. Registered cable properties
> include plug type, cable type and major revision.
>
> Signed-off-by: Jameson Thies <jthies@google.com>
Reviewed-by: Prashant Malani <pmalani@chromium.org>

