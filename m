Return-Path: <linux-usb+bounces-19261-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 093D6A0BCC7
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 17:01:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C8F53A2194
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 16:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5531E1FBBE5;
	Mon, 13 Jan 2025 16:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evCnlqaa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514BA24023E
	for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2025 16:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736784053; cv=none; b=OnhCRUyYEHjHQ9sAQMRadP8BgUSc0KBlMBDnMY4M37ly/EF4JxC4SKYPVZOeIdIIBYxZUv3qKWDo7w44jwH+KDZL0+CQs77qvV+zxCo/QMx1cA32PN9YeLug6Hy0jum2j2Jf0yFVV4Euk+8F2zh3Fkm8RXhHjZcbdbr2QdEWfF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736784053; c=relaxed/simple;
	bh=5UXrXNJAqwGTrHL/s7TDCieagEvsJBCpKQ1CfPGQvDo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tk2mbSIIHe9PeJ+JQ4HlG9pRovGb8wmDsRCZaoEy/PNbQAm+Ad8mQWaajbcSbwxZJ9Z7xgWM0yrepWm/LCwpbD03obsBZAFxH+zgpMh3KhL9r+9oVmTFBJh4pwVZ8PgweLMb034sCq9Kzn3ZKJcAH3vYkjL4dqDT4eFZDT24w4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evCnlqaa; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aaeecbb7309so839080866b.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2025 08:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736784050; x=1737388850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UXrXNJAqwGTrHL/s7TDCieagEvsJBCpKQ1CfPGQvDo=;
        b=evCnlqaaZ4FeaHEbtyVcHf8O8YePShrIB1MzfWuO7qsUXiTy+DT/lSQWveCYmBI1sG
         XmGqM6Vso26tA6z4DAbbS4SdzYIaVgi7KdeWzuBw793H4kTVPTB4Gncc1l5Wjf+AX676
         ckYNbhH5C/piQlbjettNEn+rzi7wyXIbxZPF7+Va+vNNeioaUGZKLcfYkN7nJyR49d8c
         PjGoe8Xpdlgs+Lw3y7f+CZjDBd5SfbRsXRkJcL4HxPYrsqVwhLqhGLuemX9aTaFgP4su
         1GrKIMYpYzKMaTmOasZbi2JDPsvV6okbvHK1dphbB7xWjYe9o7RWe09fSW+/LR+iE7qM
         740Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736784050; x=1737388850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5UXrXNJAqwGTrHL/s7TDCieagEvsJBCpKQ1CfPGQvDo=;
        b=VoTDuHqo6za9K0LnP/IVIYXFiZb9EhwY+cMnWmR5VQ6bmc0mUtnYc55NWQQJHZc9Q+
         jd/1EkKdFEPQ4CtN2Abps53OKIE2hqGqpXIl2oqinb+uFzikZ7Qgd3ot+JDuzu14974G
         MPWSF6v7LmBzafHzEFbEtBqljLvFXCDQjLOfEYiIQkZ/qFP55DsyfD+8q3ihnB1nb/eD
         +0KzqahkB1WgekPDSiZj+E5iZFW1J1wOUW6TgVxTa4xhie5OwuNYIrALT3glMJaBcVlx
         tah5e9tquArBUtMUnPps+T2U908N3fUs+j/raAyi1pSFFO2I/Fi/rki0USO8yodaIGqz
         0YGg==
X-Forwarded-Encrypted: i=1; AJvYcCU1nf230mpwxTlyQKi0ow/ShSgImbwmtM4XDAKKxJarjuH90YXxvqDoBAertH/ulBFFumXobEAP7Fk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6jo9/I6xQ1NEwJxWx+7Y8J/4TA4LG5RIP6MKhe9vZH8mesFwy
	RDHT6OAXa5sKtlh2sYB+IxKK/99vC/FYf0b+uzFlv7APAbNyNOkK
X-Gm-Gg: ASbGncuiCBEY2MV2RRPAiUgkwFv7Pcu5SrT7wDnV6qHrU8DQCtvdbPN8XYRrUHo9w2J
	M1husftzPEgACfZeJ1HZ6UchtK0LbFNxS4ZioyEgfi14ClBAIWRmXCOD7JzpSTjEVHjYPaDiFY/
	KA79V6Ye42fB25du2V45niwcf6m4jIEO24Yf/kWGUSAN3Ym+NTxk8/tiBJ8Umg/GxFMWr7aMT35
	MJk4VPfKGwbEf5H/KiTA4wwrydLyvWXh6HPU6K42tgfHZ42eZd6/Zkkt3BS+Scd07lmPCY=
X-Google-Smtp-Source: AGHT+IH2tyRj2WM0LRdKjOf/FEGZEWx97Avivjz5wpkcaJGcDHIzrMpDs12kcU1tCRL24LvUVZa/1g==
X-Received: by 2002:a17:907:3da8:b0:aae:ce4c:ca40 with SMTP id a640c23a62f3a-ab2ab740698mr1812757766b.32.1736784048790;
        Mon, 13 Jan 2025 08:00:48 -0800 (PST)
Received: from foxbook (adqh85.neoplus.adsl.tpnet.pl. [79.185.141.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9060a4fsm522022366b.15.2025.01.13.08.00.47
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jan 2025 08:00:48 -0800 (PST)
Date: Mon, 13 Jan 2025 17:00:43 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/2] usb: xhci: correct debug message page size
 calculation
Message-ID: <20250113170043.25d689a5@foxbook>
In-Reply-To: <20250113143037.2131346-2-niklas.neronin@linux.intel.com>
References: <20250113143037.2131346-1-niklas.neronin@linux.intel.com>
	<20250113143037.2131346-2-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 13 Jan 2025 16:30:36 +0200, Niklas Neronin wrote:
> Fix this by subtracting one from the result of ffs(). Note that since
> variable 'i' is unsigned, subtracting one from zero will result in the
> maximum unsigned integer value. Consequently, the condition 'if (i <
> 16)' will still function correctly.

Is it unsigned? I see a simple 'int' here, so this wouldn't work.

Michal

