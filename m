Return-Path: <linux-usb+bounces-25018-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A3CAE491E
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 17:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6D7A3B4A5D
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 15:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D42D28E61C;
	Mon, 23 Jun 2025 15:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lSVAc9Cp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C298428DF3D
	for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 15:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750693608; cv=none; b=lf7s+jEInsCwuTO2dvXkldN9Mzg0fEkMDj9pNTGWr/2TSM1ZrKgzva3Oi14KR7bIJL0N3HWPPUcqTI/DD5J8gw1kg4+gWaQ4AHlwA/VNOU3HONmNs27DQuU6hqR/nLZWkJoWuK1WzXMhAgUVprlLmVwfealLr7vqtjDyeY0zB+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750693608; c=relaxed/simple;
	bh=/E1e2tbjJhNXMIIvoM+GCxz9w7Rmvz305Iw0oecgYeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fMqh1bzuyJ0Vw6p7ncWI1Vd3PJwposOg313vFiQm5GisPhlpm5cdiTuwCywHMfQB2TpkHaTYcJoh3YhW44uf5t+yNoX5oY25qmXpABOdyCLuptGZGnPmzhaXIKp68zgUnvoIXw5viwTEix1ZrzsEdfE+ilexXieRzwfltpOSiPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lSVAc9Cp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26FE8C4CEEA;
	Mon, 23 Jun 2025 15:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750693608;
	bh=/E1e2tbjJhNXMIIvoM+GCxz9w7Rmvz305Iw0oecgYeU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lSVAc9Cp5+1Ws7y3jYee34dmEbqfofeJSC8YrjBaeOK76VOfupkmOUhGCzizYIG+F
	 6Ss+2FydnL0Wj8W4Sy9sSmFE34NVihx0stNfjdsMykEgOD27MSGAkXRo6dbHUMVB3X
	 3RqX2cyW4vWbm3r5FwXEEUXY+NL23K2CpS1SS/02hV8lR6nJDfdk8G1rn6TwekrHqp
	 7cc6o+O/UjYfgUPKp58ai3fD1Ncl9+4Njevdf4EFhIfXMjl2oiGAHAzByTvsIRgymX
	 aR1y8j64ExZCmRlDhUVvL4fNx4X4/ae2KaSXp/nFQVFIsK4vgsKf+HkhXwim5Embhk
	 X9Z1xfmQycU7g==
Message-ID: <eb100c59-0d8f-4f98-8487-abc27fc925ce@kernel.org>
Date: Mon, 23 Jun 2025 10:46:47 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Wake on connect / wake on disconnect
To: Cristian Cocos <cristi@ieee.org>, mika.westerberg@linux.intel.com
Cc: Richard.Gong@amd.com, linux-usb@vger.kernel.org, puthik@google.com,
 rrangel@chromium.org, utkarsh.h.patel@intel.com
References: <35b9b1e658eb233b0bde45e0f30ba4646e1de858.camel@ieee.org>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <35b9b1e658eb233b0bde45e0f30ba4646e1de858.camel@ieee.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/23/25 10:45 AM, Cristian Cocos wrote:
> Any chance this patch will find its way in kernel 6.16? I recall having 
> no problems rebooting my laptop with the lid closed with older kernels; 
> current troubles started with kernels 6.12 or 6.13 (or thereabouts).
> 
> Thank you!

Hello,

The wake on connect/disconnect patches landed in 6.16-rc1.  There was a 
regression identified however the fix is in the -fixes branch and should 
land before 6.16 final.

That being said; I don't expect WoC/WoD patches are going to affect lid 
behavior.  You might have a different problem?

Thanks,

