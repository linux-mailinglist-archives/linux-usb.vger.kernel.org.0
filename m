Return-Path: <linux-usb+bounces-17553-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA24A9C7030
	for <lists+linux-usb@lfdr.de>; Wed, 13 Nov 2024 14:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F07BB28198B
	for <lists+linux-usb@lfdr.de>; Wed, 13 Nov 2024 13:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29DB51FCF78;
	Wed, 13 Nov 2024 13:01:52 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BD1186E5F
	for <linux-usb@vger.kernel.org>; Wed, 13 Nov 2024 13:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731502911; cv=none; b=lJv8rsJJ1xD1O5k4KbqyWikdfSNzY7YLpjMRJh8iPKzicLGWkMRxGbAeGR+uJ+sylXgI1DLLVucsjwWH3lLohgUl/Fuc/r5MQMc8RB8TiJsMCngW+YDLG4v6jjY64OTM9gCwFbROTLIiZMgWhesjVWKBmCMrk68T03k/PSWGowA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731502911; c=relaxed/simple;
	bh=r/GK5ETu5SUe8BrH6Jx/A9KZ+KVswddu7fjovf7xzLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rg0nIPkRKf6Scc8NUgJFqbBGzXkYEDcR+8nNjxAKr9LAldXuDqR1jg3WSQ7aL0IRlArSijEuV+us5OPL9fueFrBlZKbIIUQmp3tZu5y2+5Kzl3pFNPN/CLJC5OenZWW8I+x/ANkJtXkxX1nsOND9T23su2fksXR89+4oUea+F8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D9DC1BF206;
	Wed, 13 Nov 2024 13:01:39 +0000 (UTC)
Message-ID: <9ded652d-b6c1-46a8-a043-015a5af238ee@korsgaard.com>
Date: Wed, 13 Nov 2024 14:01:39 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "usb: gadget: composite: fix OS descriptors
 w_value
To: Elson Serrao <quic_eserrao@quicinc.com>,
 "Vrastil, Michal" <michal.vrastil@hidglobal.com>, Greg KH <greg@kroah.com>
Cc: "Vodicka, Michal" <michal.vodicka@hidglobal.com>,
 "balbi@kernel.org" <balbi@kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "stable@kernel.org" <stable@kernel.org>
References: <AS8PR05MB10129E57ED13CF18746FC4BE18A9B2@AS8PR05MB10129.eurprd05.prod.outlook.com>
 <5f8cdcac-6927-429a-8ef5-0891c90e8efd@korsgaard.com>
 <2024100457-able-sake-47fd@gregkh>
 <9918669c-3bfd-4d42-93c4-218e9364b7cc@quicinc.com>
 <7bab2899-9150-4e8c-9a96-b1bbf20f4d61@quicinc.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <7bab2899-9150-4e8c-9a96-b1bbf20f4d61@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: peter@korsgaard.com

On 11/12/24 19:11, Elson Serrao wrote:

> Since there has been no update for quite some time, would it be okay if I upload v2 with the feedback given ? This bug is impacting ADB enumeration on Qualcomm platforms, so would like to proceed with this fix.

Yes please!

-- 
Bye, Peter Korsgaard


