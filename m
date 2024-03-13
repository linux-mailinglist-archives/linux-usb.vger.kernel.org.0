Return-Path: <linux-usb+bounces-7898-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 937B587A0A5
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 02:23:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F7FD283DD4
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 01:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 922588F6F;
	Wed, 13 Mar 2024 01:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DLhhjfmH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9477AD54
	for <linux-usb@vger.kernel.org>; Wed, 13 Mar 2024 01:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710293001; cv=none; b=azOcIcF7Ji8c1jkUW9l4shMiWfvtBDhvoJpK2wHS4iB7y8vSpvvr22gKcry6BJM3/nY8oXOireh4hvZASNDfLUHfXwqGQfCaOMNVq7WBzsehotLL2kPaCK8oMr1bjQIN59DOc2ysJjIbbh7VfPAv6z5fo0ryMJWajSw7xDn5cJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710293001; c=relaxed/simple;
	bh=hQeIdsuKa2fEgNIBIo8QSqqLrN2zLegVUj5J4tkoXYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OPQGjzKQXgJPcGMZG/BfymRae2l0m+msbSNtP51EB1zizLy1RIH7NQ7MgcqiJA0Boq9irWhupQrUrsJn/e6kO3eAxZhp1bNXkjUE0LkKs3CzVH71Px1GMVdYfNack41gdiwJjwoP038jPj5iamnirkkGRMBseatL71DsZnBqKgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DLhhjfmH; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc74e33fe1bso5706438276.0
        for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 18:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710292999; x=1710897799; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQeIdsuKa2fEgNIBIo8QSqqLrN2zLegVUj5J4tkoXYM=;
        b=DLhhjfmHkFkLVdlpxyG/7KnY7ywGq4G2vlCJ+leKhXYSDEoZYPN7pDwkXmfksZ2w+M
         ptMyNY6RuEFRSuv+kToE6ZjIWnOYHRMPIOheI9QLIEYEuGLGsUoKdRAvxFeP5JghCgy9
         +htX53Fthuagx27/yCbG9tdviCkU5qYMF/NEi4ITsutF3RXxzwckjQlL90NYgVxl6nLb
         YVtiVJ7WKL08eZLib0jtCAK+ylADTBCkTAo66W+7hZ+PO/VBRCpBWziOlydYjzuLwURA
         Xl7/BscwggwJ5eGVoIEQoXSO37nchGNZfD047f/Jg4IhvlyAgZvtvBHhz5wTs0HFxrbQ
         Khcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710292999; x=1710897799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hQeIdsuKa2fEgNIBIo8QSqqLrN2zLegVUj5J4tkoXYM=;
        b=jYo2n6eryPTACvBSLvaraNoRbYdT/nJpX/VZxDcDan59jl9/Jtd9047zM1GvRjjWHv
         MyVeW3jfeHAZyJAtRD965FPzshaQxbPAAHHLH5A0P/UBGy7rEJw4tKoDOikPP7sXax/g
         1sjAab4tRVw5hFOzqITi2Jezal8bscuxjfuqzblnihyvfHpvPe5+bqxbGAp55KZPn0F1
         nAmb4IMxyw0OleGgj/xOY8g7nFGDKjEPfA4DT7d2vGH65p2+llBY0oQ+3Nrn2MfC2XJC
         p9nufY18BNJIF5cBYD/GT4yQ5GjYKkeN6/8ZV1q3VqjM0k94537bgigaLVliKbdJly75
         bCnA==
X-Forwarded-Encrypted: i=1; AJvYcCVEWgiTcEQ8WTAT/0mQaRu54YNUJ0FPVsLyFfrNB1tpbeuc+kHSXgRjpj95oWpylyXzVgldN5WlqP0OO27gix7Spx96vZkqa4vb
X-Gm-Message-State: AOJu0YzJXKbllb81ypxgyGSUsfKT/hampc+wkd1gT+wjbwOeSkpLBDpR
	fJx+EEqQe332y1D9HFrX02uT/rbZvdprBAv+HpbaftU3ltoUukAPNlmM77cc6F2Ubm0jx9BtKxz
	dRvFt+C3G0t9tfoFeB+nPfmNB11s=
X-Google-Smtp-Source: AGHT+IGsTJirEtgZ4NnDrE4/FKocT49OVKP00Z6OIxxiWR2ntWMC7j6UxuEN6rSKDvKJ1XgtGGwvW2BMmX+i/nwxq8Q=
X-Received: by 2002:a25:2d25:0:b0:dcc:744d:b485 with SMTP id
 t37-20020a252d25000000b00dcc744db485mr1007486ybt.33.1710292998506; Tue, 12
 Mar 2024 18:23:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240312055350.205878-1-alexhenrie24@gmail.com>
 <20240312055350.205878-6-alexhenrie24@gmail.com> <1710257483.14565.10.camel@chimera>
In-Reply-To: <1710257483.14565.10.camel@chimera>
From: Alex Henrie <alexhenrie24@gmail.com>
Date: Tue, 12 Mar 2024 19:22:45 -0600
Message-ID: <CAMMLpeRU+JuaaQO=aBedSrJfUhJfSymxdB9Bcwk24ZfAeG2GSg@mail.gmail.com>
Subject: Re: [PATCH 6/7] usb: misc: uss720: add support for another variant of
 the Belkin F5U002
To: Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>
Cc: linux-parport@lists.infradead.org, linux-usb@vger.kernel.org, 
	sudipm.mukherjee@gmail.com, johan@kernel.org, hkzlabnet@gmail.com, 
	reboots@g-cipher.net, mike@trausch.us
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2024 at 9:31=E2=80=AFAM Daniel Gimpelevich
<daniel@gimpelevich.san-francisco.ca.us> wrote:
>
> You didn't add the "P80453-B" label in this patch nor in PATCH 5/7=E2=80=
=A6

Patch 7 adds it to a comment in uss720_probe. The reason I didn't put
the comment into uss720_table is because the F5U002 Rev 2 P80453-B
doesn't work with this driver. I would love to know which device with
ID 05ab:1001 was previously tested and found to work so that we can
document it.

-Alex

