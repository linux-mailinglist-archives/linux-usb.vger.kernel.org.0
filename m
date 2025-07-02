Return-Path: <linux-usb+bounces-25420-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEF4AF613A
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 20:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB5D37A3DDD
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 18:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B112E49A5;
	Wed,  2 Jul 2025 18:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nQuf8LIn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A76A19A
	for <linux-usb@vger.kernel.org>; Wed,  2 Jul 2025 18:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751480761; cv=none; b=vBDCjpFC6zDF8EqOuOMUyDdq27bVvH0WrTeK8xwE0rU586oiWXaMXABLXgZvxTaCnuaMWU6eciAnjS+T9ytQfRffLKYhgdsidaTOxEeY2jqvYlSo8J1haiyrdegKW9yBJYs3gR7fSoFtyyIgN4kTFRGo/mddU+63vvXXDTpCHTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751480761; c=relaxed/simple;
	bh=cP+0ATCRvpAvtFlU34IpenBbWEpHm0+eCpjenPlq48M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=clQerFxV/F1zLCze4dW2fLvcq0zygJamllGB02miiMeHwyiEqAznfjVLfGI4lLnPpioXJJYNpxfRfQkFdALvbY9VZ/GjFiUVvJyKMc535tZ5Tp3aOCMxm6CUZNW0tWn/PoxILHBOEXQR8JnqWpBmC82QZYfzpnbBByAQ9AKwYIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nQuf8LIn; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751480760; x=1783016760;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cP+0ATCRvpAvtFlU34IpenBbWEpHm0+eCpjenPlq48M=;
  b=nQuf8LInCYrA64ybEICJXnQ71N5mHQGc1Q3F6KD/EcBHNz2pKG6QdYG3
   CzLKk+RubpnIZ0ftW2VHXHm3PPkZ7XkBuIoSLW8DH3XcMmzaCYvxk6CaT
   1qDSXpqghevt72s+qbwBEWJk0TyjODblXavElcf6ao6S10iCfqXNChn9Q
   arXpR/T1Gwo32uPb0hNFyzUN15V5fctlHO+DxapqnhBVHUXXKktV9RnwD
   i0trgwmj4OHuGcXOEWGxV/LCYai8NMKYd/a2rJRALw5tQj8Va7EdxwStn
   0Vu/MrEaTeINnqmsTyc5ViU+2At8drfEYmqyziX43r9IlMRo+wDKBPeBu
   A==;
X-CSE-ConnectionGUID: ixJ3tDOqSzWw2kw5EiW0Xw==
X-CSE-MsgGUID: neDMf0uzRoyNfIf8pFUTNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53886842"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="53886842"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 11:26:00 -0700
X-CSE-ConnectionGUID: sJzOKeJcTGWwOf3Tv05Hkg==
X-CSE-MsgGUID: 7pw78VnAQYmuTakYUJMBkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="158716382"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 11:25:59 -0700
Received: from [10.121.200.103] (unknown [10.121.200.103])
	by linux.intel.com (Postfix) with ESMTP id 1F6DD20B5736;
	Wed,  2 Jul 2025 11:25:59 -0700 (PDT)
Message-ID: <5fb4b111-b823-4de4-86f2-41f934f8f660@linux.intel.com>
Date: Wed, 2 Jul 2025 11:25:58 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: ucsi: Add support for READ_POWER_LEVEL
 command
To: Greg KH <gregkh@linuxfoundation.org>,
 Venkat Jayaraman <venkat.jayaraman@intel.com>
Cc: linux-usb@vger.kernel.org, pse.type-c.linux@intel.com,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20250630001556.651826-1-venkat.jayaraman@intel.com>
 <2025063018-stunt-hamstring-0331@gregkh>
Content-Language: en-US
From: "Jayaraman, Venkat" <venkat.jayaraman@linux.intel.com>
In-Reply-To: <2025063018-stunt-hamstring-0331@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Greg,

On Sun, Jun 29, 2025 10:04:14PM -0700 , Greg KH wrote:
> On Sun, Jun 29, 2025 at 05:15:56PM -0700, Venkat Jayaraman wrote:
>> @@ -89,6 +117,12 @@ void ucsi_debugfs_register(struct ucsi *ucsi)
>>  	ucsi->debugfs->dentry = debugfs_create_dir(dev_name(ucsi->dev), ucsi_debugfs_root);
>>  	debugfs_create_file("command", 0200, ucsi->debugfs->dentry, ucsi, &ucsi_cmd_fops);
>>  	debugfs_create_file("response", 0400, ucsi->debugfs->dentry, ucsi, &ucsi_resp_fops);
>> +	debugfs_create_file("peak_current", 0400,
>> +			    ucsi->debugfs->dentry, ucsi, &ucsi_peak_curr_fops);
>> +	debugfs_create_file("avg_current", 0400,
>> +			    ucsi->debugfs->dentry, ucsi, &ucsi_avg_curr_fops);
>> +	debugfs_create_file("vbus_voltage", 0400,
>> +			    ucsi->debugfs->dentry, ucsi, &ucsi_vbus_volt_fops);
> You can have these all on one line, but not a big deal :)


I can change that in the next revision.


> And what are the units of these files?
>
>> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
>> index 01ce858a1a2b..8e0f0289a11a 100644
>> --- a/drivers/usb/typec/ucsi/ucsi.c
>> +++ b/drivers/usb/typec/ucsi/ucsi.c
>> @@ -1218,9 +1218,11 @@ static void ucsi_handle_connector_change(struct work_struct *work)
>>  	struct ucsi_connector *con = container_of(work, struct ucsi_connector,
>>  						  work);
>>  	struct ucsi *ucsi = con->ucsi;
>> +	u8  curr_scale, volt_scale;
> Odd extra ' '


Will fix this in the next version.


>> +	if (UCSI_CONSTAT(con, PWR_READING_READY_V2_1)) {
>> +		curr_scale = UCSI_CONSTAT(con, CURRENT_SCALE_V2_1);
>> +		volt_scale = UCSI_CONSTAT(con, VOLTAGE_SCALE_V2_1);
>> +
>> +		val = UCSI_CONSTAT(con, PEAK_CURRENT_V2_1);
>> +		con->peak_current = UCSI_CONSTAT_CURR_SCALE_MULT * curr_scale * val;
>> +
>> +		val = UCSI_CONSTAT(con, AVG_CURRENT_V2_1);
>> +		con->avg_current = UCSI_CONSTAT_CURR_SCALE_MULT * curr_scale * val;
>> +
>> +		val = UCSI_CONSTAT(con, VBUS_VOLTAGE_V2_1);
>> +		con->vbus_voltage = UCSI_CONSTAT_VOLT_SCALE_MULT * volt_scale * val;
> These will never overflow, right?

The values (val) are 16-bit max and there should be no overflow concern with u32 fields declared.

>
> thanks,
>
> greg k-h
>

