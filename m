Return-Path: <linux-usb+bounces-31718-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A32C3CDA740
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 21:18:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEF653013571
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 20:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D6932D443;
	Tue, 23 Dec 2025 20:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QFAOQ1iJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4973158DA3
	for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 20:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521107; cv=none; b=AKRWCklax2cKdrMDJ4xFc7qYNUFKYkdXz8IxcX8yVVXsByt2QOg/iZX+tLym1Eo6oycbBG0zeWzyhn9+wT4T389rqcRVKoKRl/0yN4isnsu8BjoqwCbEcUTsKwoud1cEShPrkJNOcuc4Q2yegu4SynT5gi9DlUCtLzoJh0P6lpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521107; c=relaxed/simple;
	bh=DObSqsdwx6jQqA/T6TgOtH8v30/kjrtwRtbl+q/tgFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LUBMS6MZsZ4Kmcb8ovF6USQa5kKgvsXjuYZ00QRDrqavRi0p7FOE0dF6bYO4uyDY3NxFFOvYOL+zvQ+x6wKmPffk3z8Qaaj6ZLzLGq3k42EIK6jzbHMA6AbtqQJ3f6oOOSUpjGBeKCJxzrJoo5vC2N/eOfdXf3m4ZmJb6bwVBsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QFAOQ1iJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766521105; x=1798057105;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DObSqsdwx6jQqA/T6TgOtH8v30/kjrtwRtbl+q/tgFA=;
  b=QFAOQ1iJNdFlEFIEVBGbW53seaiEo+3V0SE+VJxuKMp4Ok4Vw2WC8P8O
   wRuECu0+fOrZmGvgm7WsGCcVDTIQ0J/ZByX96QYdzjqpyKnh8lYVkDVrJ
   hUjPm8rbw+xPZYXFFgLVBlM/anI8sbl9CxLGDQflL9pRfVsVIMMFXWaCo
   r9l74zMuDKHQi3REYN/T3liw0J43UZCKmxoKaKH/JAxIDWUAf2+n3/M/w
   k+2nT3Dbwk0EyKlIJHwspnL6lIyKjMCXpgTrjU/kJFH6L8VUJuiB9tBXf
   MpMoJ8CiabfWpRstXodkgcoqW/pWKEZeWb6/bKpyHukqc3eTgTP2p1GRZ
   Q==;
X-CSE-ConnectionGUID: qCAsdmmbTfSmpnzEsO11vw==
X-CSE-MsgGUID: EkI+gaoQRDCqHv2Nwhjw0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="55939778"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="55939778"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 12:18:25 -0800
X-CSE-ConnectionGUID: Zgeaqw9kQQOYxYx0MBHIBw==
X-CSE-MsgGUID: kNLVcOVYQv+sULyb+W4Aqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="237263988"
Received: from soc-5cg1426swj.clients.intel.com (HELO [10.121.200.125]) ([10.121.200.125])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 12:18:24 -0800
Message-ID: <fafdfe91-84ae-48c6-a5c5-193ac3673f5e@linux.intel.com>
Date: Tue, 23 Dec 2025 12:18:22 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] usb: typec: ucsi: Update UCSI structure to have
 message in and message out fields
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Pooja Katiyar <pooja.katiyar@intel.com>, linux-usb@vger.kernel.org,
 gregkh@linuxfoundation.org
References: <cover.1761773881.git.pooja.katiyar@intel.com>
 <214b0a90c3220db33084ab714f4f33a004f70a41.1761773881.git.pooja.katiyar@intel.com>
 <2tlusuyqp2jif37smm57skeo3g2trzdspirv6minlopo5cey7m@z23tworiljkg>
 <66950556-3313-470b-bb51-82e14ce144cd@linux.intel.com>
 <349e1f70-7e40-4e3e-b078-6e001bbb5f1a@oss.qualcomm.com>
 <aUqF1EGxbiY1A1Eq@kuha>
Content-Language: en-US
From: "Katiyar, Pooja" <pooja.katiyar@linux.intel.com>
In-Reply-To: <aUqF1EGxbiY1A1Eq@kuha>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

On Tue, Dec 23, 2025 at 04:06:44AM -0800, Heikki Krogerus wrote:
> Hi,
> 
> Thu, Dec 18, 2025 at 03:22:43AM +0200, Dmitry Baryshkov kirjoitti:
>> On 18/12/2025 03:17, Katiyar, Pooja wrote:
>>> Hello,
>>>
>>> On Fri, Dec 12, 2025 at 06:58:06PM -0800, Dmitry Baryshkov wrote:
>>>> On Thu, Oct 30, 2025 at 07:48:55AM -0700, Pooja Katiyar wrote:
>>>>> Update UCSI structure by adding fields for incoming and outgoing
>>>>> messages. Update .sync_control function and other related functions
>>>>> to use these new fields within the UCSI structure, instead of handling
>>>>> them as separate parameters.
>>>>>
>>>>> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>>>> Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
>>>>> ---
>>>>> Changelog v3:
>>>>> - Added message fields to UCSI structure and updated sync_control handling.
>>>>
>>>> Colleagues, after looking at this patch I have a question. What prevents
>>>> message_{in,out}{,_size} to be modified concurrently? While we have PPM
>>>> lock around command submission, size fields and buffers are modified /
>>>> accessed outside of the lock. Granted all the notifications and async
>>>> nature of the UCSI and USB-C protocols, what prevents two commands from
>>>> being executed at the same time with one of the execution threads
>>>> accessing the results returned by the other command?
>>>>
>>>> In other words:
>>>>
>>>> - thread A sets message_in_size, calls ucsi_send_command(CMD_A), which
>>>>    takes PPM lock
>>>>
>>>>     - meanwhile thread B writes another value to message_in_size and
>>>>       calls ucsi_send_command(CMD_B), which now waits on PPM lock
>>>>
>>>> - thread A finishes execution of the CMD_A, copies data (with the
>>>>    wrong size!) to the message_in_buf, then it releases PPM lock.
>>>>
>>>> - thread A gets preempted
>>>>
>>>>      - thread B gets scheduled, it takes PPM lock, executes CMD_B, gets
>>>>        data into the message_in_buf and finally it releases PPM lock
>>>>
>>>> - finally at some later point thread A gets scheduled, it accesses
>>>>    message_in_buf, reading data that has been overwritten by CMD_B
>>>>    execution.
>>>>
>>>> WDYT?
>>>
>>> Thank you for identifying this race condition. You are correct about the
>>> concurrent access issue with the message buffer fields.
>>>
>>> Here are two potential approaches I see to resolve this:
>>>
>>> Option 1: Separate mutex locks for message variables
>>> Add a dedicated message_lock mutex to protect message_{in,out}{,_size}.
>>> message_{in,out}{,_size} will only be modified within the message_lock
>>> protection.
>>>
>>> 	mutex_lock(&ucsi->message_lock);
>>> 	ucsi->message_in_size = size;
>>> 	ret = ucsi_send_command(ucsi, cmd);
>>> 	memcpy(buffer, ucsi->message_in, size);
>>> 	mutex_unlock(&ucsi->message_lock);
>>>
>>> Option 2: Pass message variables as function arguments
>>> Pass message buffers and sizes as parameters down to where ppm_lock is
>>> acquired, ensuring protection throughout command execution.
>>>
>>> 	int ucsi_send_command(ucsi, cmd, msg_in_buf, msg_in_size, msg_out_buf,
>>> 			      msg_out_size) {
>>>      		mutex_lock(&ucsi->ppm_lock);
>>>      		ucsi->message_in_size = msg_in_size;
>>>      		// execute command and copy results to msg_in_buf
>>> 		memcpy(msg_in_buf, ucsi->message_in, msg_in_size);
>>>      		mutex_unlock(&ucsi->ppm_lock);
>>> 	}
>>>
>>> I'm leaning toward Option 1 as it resolves the concern of passing too many args.
>>> What are your thoughts on the suggested options or do you have alternative
>>> suggestions?
>>
>> I'm slightly biased towards  the second option (it doesn't required extra
>> locks and it also is a bit more idiomatic), but I'm fine either way.
>>
>> Looking forward to seeing the fixing patch!
> 
> I don't think you are fully solving the problem.
> 
> Pooja, you know my opinion. This whole approach of using separate
> files is wrong. IMO we should only have a single file for the entire
> UCSI mailbox, and the mailbox should be allocated searately for
> everyone that opens the file. I don't think there is any way to
> guarantee that the data in these separate files isn't for somebody
> else.
> 
> thanks,
> 

Thank you for your feedback! We will work on a redesign for clearer implementation.

Regards,
Pooja


