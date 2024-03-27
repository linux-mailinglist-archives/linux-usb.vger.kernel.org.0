Return-Path: <linux-usb+bounces-8448-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCE588D529
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 04:47:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72EFC2C8083
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 03:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A9C22F08;
	Wed, 27 Mar 2024 03:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NDXyIYB4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6CD20DD0
	for <linux-usb@vger.kernel.org>; Wed, 27 Mar 2024 03:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711511233; cv=none; b=NQGUf8MffvZA6YnBpEdrp1PpLnH/ckLVMJwJYMujo3wHjHjZj8flVcqwLexmEkzyQ7HcqHzlOwqwPTrm6bhoOyPD9LV5elDJfm0Ma7zBohRFH9Crb2h6Hu5ZAeQsYp1Ik98s3Era+w0KYKsyui2YL2pcDB4Ru7u2c3chR1GzJus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711511233; c=relaxed/simple;
	bh=NzemdoyjALEp5Ne0oRNHFHMDDDAlBGl0VlU9gOElQdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A8z8vEGj2EGN/mSTZzOoSYpaHfC33m2iBo+PkR7SW6evFWpKB3/OjfukQ/zzr2JporO7Rk8uxieFdLz1t/ynmekZPbtLAkwpBspY+Ew2O9oWrQZtWETTf4lFRKjN8hZGbXSTyvd2cmjiNxuUjR4Uh41X5RGTYkG87vj52LSayyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NDXyIYB4; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4d8a2ff9d68so551050e0c.0
        for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 20:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711511231; x=1712116031; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NzemdoyjALEp5Ne0oRNHFHMDDDAlBGl0VlU9gOElQdc=;
        b=NDXyIYB4XXx4IX9pA4qsNgpit4srwr3pxzp2kG0qm8GUP6I38ToFaAnU4bYVyscbiU
         gRx+BdE13rCkSXrq/i08hMLWNOJpvJYvD8R3jXwit6Di05kDkaWfcStVM7ktv2WBO79Z
         u7UvB1l1qPNVSwAWafQJ7rUNizCemvWZtJ1FE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711511231; x=1712116031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NzemdoyjALEp5Ne0oRNHFHMDDDAlBGl0VlU9gOElQdc=;
        b=uPgH0t6DH0kUP1cPyGGx9Tf1lsg4DXirMH38xTtFYhDnixA+KVmOyN3lNFqcBGe3uy
         DssnxnVLGoUXu7wwi+544hWdRSxpb9VHxXlu4raDNU5bad3Hfz3bwkUT0LTSWIohMQLN
         ybl5+WwTu9QagFbb+t97dfuFOYBip139eUSlqU5lKk1zZWhTmWr02PVTJI15TlM2Sxhd
         cKawp/+yqpoE9z4Qv67m77dZZXlW0pYia+Wtp3VpXeF+pflvJbz/7OR4DWLIYfKemeDl
         CWpwS6n5cgg/eznlXm2cuV69ZzVbNYSXguEoHlp33OsdGZieVGNGfeSmSp53BYOdsYJ7
         376w==
X-Forwarded-Encrypted: i=1; AJvYcCWq7riK4VcVSd9jfvVzGy8AolO/BbUPPlu9xDDTvStq8bbg1sVObmRdlcgDxsKppNDdz+m9V3HWxX/zBH8vK1XugD1leD3RNbvI
X-Gm-Message-State: AOJu0YyONb+KvAfSDeyovZhHULXgSVd0BbUqZ4f4DTCbddG8HmaCfO6U
	QtnS1aXJfItjG7GsW5KpzH3Wo3JiM1xDA/VpVNMtmCDgdLNSiIF6GA9uDIWGwNIqaPAWr+jYH6u
	DYFd7DwPWJfCYULtj432nrzpaZCMfSDQLw9ia
X-Google-Smtp-Source: AGHT+IEnAe/XEivX0tpGpVeOk/Y1JjQzcaU0hnYqVCd0bNPmDAgKWMvmA6VqDC4R+aIAB8lzbhuYESGZN3G6h+iEosI=
X-Received: by 2002:a05:6122:8c6:b0:4cc:29cf:a1fa with SMTP id
 6-20020a05612208c600b004cc29cfa1famr1744790vkg.4.1711511231123; Tue, 26 Mar
 2024 20:47:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325-public-ucsi-h-v1-0-7c7e888edc0a@chromium.org>
 <20240325-public-ucsi-h-v1-2-7c7e888edc0a@chromium.org> <CACeCKaehH3Qs8y-W_jsyOdnTYWVzgsGj5_wGujjYT2Sr8xxqkA@mail.gmail.com>
In-Reply-To: <CACeCKaehH3Qs8y-W_jsyOdnTYWVzgsGj5_wGujjYT2Sr8xxqkA@mail.gmail.com>
From: Pavan Holla <pholla@chromium.org>
Date: Tue, 26 Mar 2024 20:46:35 -0700
Message-ID: <CAB2FV=662xWkfEJf0eqnrn6mBPFM88oy7QTTSYMkLo=6wPeoHw@mail.gmail.com>
Subject: Re: [PATCH 2/3] usb: typec: ucsi: Import interface for UCSI transport
To: Prashant Malani <pmalani@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 7:11=E2=80=AFPM Prashant Malani <pmalani@chromium.o=
rg> wrote:
> Can you squash Patch 1/3 and this Patch (2/3)? It sounds like an
> atomic change that doesn't need two patches.

Acknowledged. Will do it in the next version.

Thanks,
Pavan

