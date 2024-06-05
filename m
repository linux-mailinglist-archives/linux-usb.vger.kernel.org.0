Return-Path: <linux-usb+bounces-10905-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACC98FD19E
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 17:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 435E2282579
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 15:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E56A481B3;
	Wed,  5 Jun 2024 15:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=siemens.com header.i=diogo.ivo@siemens.com header.b="c7/xBj9Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5824D5A2
	for <linux-usb@vger.kernel.org>; Wed,  5 Jun 2024 15:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717601362; cv=none; b=FKTYZUfkBIlBrb3uugDq3s1KMeXjs2sx32wjMpSM26oqPxzQlxr2/GgGaXq7l8s02HfMEOzpsKZJdZ357NOXO3lVfS/SV9kZwBN37OC7yLT7fYZyiP+oQ5fTrW/g4q0VhLPSXzFJZKPtysOP23TfgIElumy24FxkOg3vZR7cyQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717601362; c=relaxed/simple;
	bh=lYE4mLW4/3gTTTeblhA4fcedkm6JVBcKv/nqj5RQWbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hwe8ZhSXSqime4GfXsOWDeUy2yhy/i/HyL80ynHrejip1HRuZujIHZpxuzhm9qYdQJs41dRjy9yY2OoyD4qCFQZn6oBmlp1mg72R8y5Jr2bEy7E3WtYs7MyqwbG7v/HR2RXZtbKI46QAezGUnPD9G8bhD63kUG+UwAhL4ZIY6+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (1024-bit key) header.d=siemens.com header.i=diogo.ivo@siemens.com header.b=c7/xBj9Q; arc=none smtp.client-ip=185.136.65.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202406051529127163b379a8bf7f9b35
        for <linux-usb@vger.kernel.org>;
        Wed, 05 Jun 2024 17:29:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=diogo.ivo@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=lYE4mLW4/3gTTTeblhA4fcedkm6JVBcKv/nqj5RQWbM=;
 b=c7/xBj9Q3Nu7BlSuOm5AYocnULLKZkmuIpnYSMKe5F5wn173MbfZ++XL1/Jo1Cex6Qw9gZ
 Us1Ti3LM6Md+P2m3NvOFWLtN0Vbibkek3Cp+XwcW/rbtNX2gv02Gq5uOsuLPfdPdQ3sR5GXf
 BhEO/fzyNUeaE2arihgxYyQ1+/K/8=;
From: Diogo Ivo <diogo.ivo@siemens.com>
To: mpearson-lenovo@squebb.ca
Cc: gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: treat get_pdos not supported condition as info instead of error
Date: Wed,  5 Jun 2024 16:29:11 +0100
Message-ID: <20240605152911.167179-1-diogo.ivo@siemens.com>
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

Just realized Dmitry said literally the same thing as me. Sorry for the
extra noise, please ignore my comment.

Best regards,
Diogo

