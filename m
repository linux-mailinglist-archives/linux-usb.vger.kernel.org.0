Return-Path: <linux-usb+bounces-9106-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C4E89D21C
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 08:08:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E022F1C2117B
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 06:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C4F6BB20;
	Tue,  9 Apr 2024 06:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicklyemailsend12.com header.i=@quicklyemailsend12.com header.b="Cit2Nk+v"
X-Original-To: linux-usb@vger.kernel.org
Received: from quicklyemailsend12.com (quicklyemailsend12.com [164.132.59.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5C24C69
	for <linux-usb@vger.kernel.org>; Tue,  9 Apr 2024 06:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=164.132.59.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712642911; cv=none; b=n8lFpuMDKG8P1TuLxdDjrJZzGECj3vRLvUf1K3Ut/OfmlA/6ZhXJoX+OyycGjaZgv0tkESaEVUvkkGDtsJV0QeCcsSGFNvVHfqqrEIu0/p9HBqKbXP51acHOKVn6JtkQV/MzQ+7VZOLzizhXE2fbAYOVvnVCvRAjGkL8hjmYhbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712642911; c=relaxed/simple;
	bh=UYR4B9ECg1XwPEWjcb0afoPgRCZ0daWWrUm8ZxuVfRA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KLhSt+/afcx9KzTexNC6oZ/0jWC6zMdPfQ76/4gas4E49KAm5JK3KaKJvsErjHaVk0pbf95QkOh/08EHS1pt2jkz1IR9hchVmPrdYWjqDJkksf3ooDSRu+ypQwOoayog9qw91IlqdSKsgmspVMCx0LFoLvDh8UAY/bvzo1k2858=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicklyemailsend12.com; spf=pass smtp.mailfrom=quicklyemailsend12.com; dkim=pass (2048-bit key) header.d=quicklyemailsend12.com header.i=@quicklyemailsend12.com header.b=Cit2Nk+v; arc=none smtp.client-ip=164.132.59.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicklyemailsend12.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicklyemailsend12.com
Received: from quicklyemailsend12.com (unknown [103.96.83.38])
	by quicklyemailsend12.com (Postfix) with ESMTPSA id E76737F7D5
	for <linux-usb@vger.kernel.org>; Tue,  9 Apr 2024 06:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 quicklyemailsend12.com E76737F7D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=quicklyemailsend12.com; s=default; t=1712642514;
	bh=UYR4B9ECg1XwPEWjcb0afoPgRCZ0daWWrUm8ZxuVfRA=;
	h=Reply-To:From:To:Subject:Date:From;
	b=Cit2Nk+vzOsM4GhOxlWgo8UarSyVxVJmVSiDxyjPqhL9WHUlPHmoPK5A8sVBrsbZE
	 4GytVsvIy6FEaA3MTW4FkQdlZhDNNTJgbckBG/4QgJQMHzeOJyY7q+0W7uv2zJFV9a
	 qkSizIAm+DBIy1Gn0cTVk2+v7isHs1RRT5BVDXQW4T3bv8B7a9/eUwBCBZXINh+EcH
	 pSZx0GHLdH+p4kExIkW44PeiQOVb/81pKT0Y25tYmJQSM27s43OiFsly+ppvGebhSB
	 N+cxxTCFAbW1TzJU7DYUwlgBpkHLfBURvy0GutoQwTrk7YsMW9vSOcb6Nq7loA6LIr
	 hpEWOZEDjIqmw==
Reply-To: stern.arnlund@gogreenwalter-se.com
From: sale@quicklyemailsend12.com
To: linux-usb@vger.kernel.org
Subject: New inquiry from sweden
Date: 09 Apr 2024 16:01:53 +1000
Message-ID: <20240409160152.054F7334DFF70277@quicklyemailsend12.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

My name is stern Arrnlund Head of Department, purchase. We would
like to know if you export to Sweden, as we need some of your
products for our client, kindly gives us a reply so we can send
you the full specifications and details of what we would like to
purchase.



We would appreciate your prompt attention to this request, as we
should begin a cooperation as soon as possible.



thanks & best regards.





Sten Arnlund

Purchase Manager



stern.arnlund@gogreenwalter-se.com



a: Veddige by 2, Holmerskulle, 432 68 Sweden.

