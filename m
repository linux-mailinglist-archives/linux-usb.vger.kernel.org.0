Return-Path: <linux-usb+bounces-31559-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3443ECC9F6C
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 02:19:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 252913007975
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 01:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3FC214812;
	Thu, 18 Dec 2025 01:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oCTsc2FU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F784C13B
	for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 01:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766020641; cv=none; b=X00Ca5KX2ifUx+hfDZ/PHefnnfXXmPN5zB1ogAKSI6uo44kif1SOtERXLKcoj/l/ame2mwJ5XR/R+vHNpGszJ54IA/9bHzI43Egn+96bwQKZLiEe5dtL1oUMQCS8rgYRDYJOrmD7BppKUGfKFGFj/POX3DdjIxNx7EmcK0f7CcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766020641; c=relaxed/simple;
	bh=7Ni6VtkeJWmKcHldtHzFfWZZURvHBewPedv2D8ZcmDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J5yE0uFc4EyX1cv9Rlk4JoGnKOczNlow1h7sGgSo2t9Zif+ZNCoV4DekF9v3nEpkqX6cETiWzmqEZ1WmlS1YGdBDOigzCBreVDDWoTxu9pPT+8Wk2SkiWlgWWn+LwOosCyoSMysJrq7N7gHiQF6VrzJFSK8UsORiqjSk4ACsQ+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oCTsc2FU; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766020639; x=1797556639;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7Ni6VtkeJWmKcHldtHzFfWZZURvHBewPedv2D8ZcmDI=;
  b=oCTsc2FUhWQobgvCXNrVmKJrSP8lufko05mXuqVejFOiQCpTeCwYyLF9
   1Qp96J5huq+nxcj/v3NIgFjOMCaVeXN2VKNe+jB8NyLPJ2Agg4NHjf8mV
   0UbbThdmHDcmWvns59Rqc/2p/bd+K+bHqHLEfIS24XeWnJ9eSm42zIW6U
   J4/Ge+3Ov1S/w8GHo1QIRoPyaHmScivP3dFOsyLGBmS2tmRvbq4euW7QI
   GVcBUTF7D+CfWowjssBrgJmvMOdwONk8s57jU/4nJtw02o+H0ehmO/gUl
   wBkd31YrsUZC0XsSwsBOsHeEiQBeegwhYIAS1USJit5jbzBdy9KFkiTHa
   Q==;
X-CSE-ConnectionGUID: QtUtDsyYSIOqyzEzc69IoA==
X-CSE-MsgGUID: RHvQy/TPQrSkvwFhwVXN7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67722117"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="67722117"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 17:17:18 -0800
X-CSE-ConnectionGUID: rVGMF2ACTmmxpm6f9cMAbg==
X-CSE-MsgGUID: dkyeNJKdQv6G7ZRjC8ksVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="202642237"
Received: from soc-5cg1426swj.clients.intel.com (HELO [10.121.200.125]) ([10.121.200.125])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 17:17:18 -0800
Message-ID: <66950556-3313-470b-bb51-82e14ce144cd@linux.intel.com>
Date: Wed, 17 Dec 2025 17:17:11 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] usb: typec: ucsi: Update UCSI structure to have
 message in and message out fields
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Pooja Katiyar <pooja.katiyar@intel.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
 heikki.krogerus@linux.intel.com
References: <cover.1761773881.git.pooja.katiyar@intel.com>
 <214b0a90c3220db33084ab714f4f33a004f70a41.1761773881.git.pooja.katiyar@intel.com>
 <2tlusuyqp2jif37smm57skeo3g2trzdspirv6minlopo5cey7m@z23tworiljkg>
Content-Language: en-US
From: "Katiyar, Pooja" <pooja.katiyar@linux.intel.com>
In-Reply-To: <2tlusuyqp2jif37smm57skeo3g2trzdspirv6minlopo5cey7m@z23tworiljkg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

On Fri, Dec 12, 2025 at 06:58:06PM -0800, Dmitry Baryshkov wrote:
> On Thu, Oct 30, 2025 at 07:48:55AM -0700, Pooja Katiyar wrote:
>> Update UCSI structure by adding fields for incoming and outgoing
>> messages. Update .sync_control function and other related functions
>> to use these new fields within the UCSI structure, instead of handling
>> them as separate parameters.
>>
>> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
>> ---
>> Changelog v3:
>> - Added message fields to UCSI structure and updated sync_control handling.
> 
> Colleagues, after looking at this patch I have a question. What prevents
> message_{in,out}{,_size} to be modified concurrently? While we have PPM
> lock around command submission, size fields and buffers are modified /
> accessed outside of the lock. Granted all the notifications and async
> nature of the UCSI and USB-C protocols, what prevents two commands from
> being executed at the same time with one of the execution threads
> accessing the results returned by the other command?
> 
> In other words:
> 
> - thread A sets message_in_size, calls ucsi_send_command(CMD_A), which
>   takes PPM lock
> 
>    - meanwhile thread B writes another value to message_in_size and
>      calls ucsi_send_command(CMD_B), which now waits on PPM lock
> 
> - thread A finishes execution of the CMD_A, copies data (with the
>   wrong size!) to the message_in_buf, then it releases PPM lock.
> 
> - thread A gets preempted
> 
>     - thread B gets scheduled, it takes PPM lock, executes CMD_B, gets
>       data into the message_in_buf and finally it releases PPM lock
> 
> - finally at some later point thread A gets scheduled, it accesses
>   message_in_buf, reading data that has been overwritten by CMD_B
>   execution.
> 
> WDYT?

Thank you for identifying this race condition. You are correct about the
concurrent access issue with the message buffer fields.

Here are two potential approaches I see to resolve this:

Option 1: Separate mutex locks for message variables
Add a dedicated message_lock mutex to protect message_{in,out}{,_size}.
message_{in,out}{,_size} will only be modified within the message_lock
protection.

	mutex_lock(&ucsi->message_lock);
	ucsi->message_in_size = size;
	ret = ucsi_send_command(ucsi, cmd);
	memcpy(buffer, ucsi->message_in, size);
	mutex_unlock(&ucsi->message_lock);

Option 2: Pass message variables as function arguments
Pass message buffers and sizes as parameters down to where ppm_lock is 
acquired, ensuring protection throughout command execution.

	int ucsi_send_command(ucsi, cmd, msg_in_buf, msg_in_size, msg_out_buf,
			      msg_out_size) {
    		mutex_lock(&ucsi->ppm_lock);
    		ucsi->message_in_size = msg_in_size;
    		// execute command and copy results to msg_in_buf
		memcpy(msg_in_buf, ucsi->message_in, msg_in_size);
    		mutex_unlock(&ucsi->ppm_lock);
	}

I'm leaning toward Option 1 as it resolves the concern of passing too many args.
What are your thoughts on the suggested options or do you have alternative
suggestions? 

Best regards,
Pooja

