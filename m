Return-Path: <linux-usb+bounces-10864-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0144D8FC8B0
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 12:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F8D8285BA4
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 10:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A74749644;
	Wed,  5 Jun 2024 10:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=siemens.com header.i=diogo.ivo@siemens.com header.b="JivFtTII"
X-Original-To: linux-usb@vger.kernel.org
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53C618FDD3
	for <linux-usb@vger.kernel.org>; Wed,  5 Jun 2024 10:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717582223; cv=none; b=KqRuzjB6qqDLAvKTbtN2G18+bWnPWsXhfMXtHT8Vo1bY4m4bF3n6AhzfB/gT6hpq2DB9pkdJkSeLE3W9iXSLmM08Qg1lRp8vWw8jI/3WnPlkxgWAGjxbiWZT/gziL6Gr+oU9I5nPwGoucbTE2hnaYOlR/hWxj8iF3xoQwatblGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717582223; c=relaxed/simple;
	bh=vpLOr0dZjlNrcP+uDYVX6bFYJ1hFVQa//bGLvxJUs7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u3Z3XaSmpr5Evsws83QsGGN/5NS2FE44q2JcT9TNN2cEQD52DFDTW1X2W1iyiEYyVPxsUywN7eHuH/MuTXjs4Qr3CDgQQ1ZgtExMg8KgETrxU4vd7puSKrPtPvdgCmJa7qzoGoYgaeDBJaTwII3Rf+8QfSFuR7QjHq9uq4+wiaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (1024-bit key) header.d=siemens.com header.i=diogo.ivo@siemens.com header.b=JivFtTII; arc=none smtp.client-ip=185.136.65.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20240605101011065cf4b410e872c5af
        for <linux-usb@vger.kernel.org>;
        Wed, 05 Jun 2024 12:10:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=diogo.ivo@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=vpLOr0dZjlNrcP+uDYVX6bFYJ1hFVQa//bGLvxJUs7k=;
 b=JivFtTIIHAb7wTO7BmR06RAIRLCLR3QJYhhkTDKVc7Z6C54PdKe2f12u7zMkMc2DzwoyuM
 do3pjisYMEVC1gHj3BU2KXj0KDyXGHFsUtenteuoE9CU2M+qwaMfKYv/0X/6jKHVrO5KrYR0
 Kv+fSQOkOKML7JfK8qWa+cVeGoloM=;
From: Diogo Ivo <diogo.ivo@siemens.com>
To: mpearson-lenovo@squebb.ca
Cc: gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	diogo.ivo@tecnico.ulisboa.pt
Subject: Re: [PATCH] usb: typec: ucsi: treat get_pdos not supported condition as info instead of error
Date: Wed,  5 Jun 2024 11:10:10 +0100
Message-ID: <20240605101010.150645-1-diogo.ivo@siemens.com>
In-Reply-To: <20240604194056.16625-1-mpearson-lenovo@squebb.ca>
References: <20240604194056.16625-1-mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1320519:519-21489:flowmailer

Hi Mark,

Do these devices report GET_PDOS support as a response to GET_CAPABILITY?
If they don't I think the best way of addressing this would be to guard
against executing this command for devices without "PDO details supported"
(in ucsi_get_pdos() for example).

Best regards,
Diogo

