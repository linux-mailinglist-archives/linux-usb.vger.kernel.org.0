Return-Path: <linux-usb+bounces-20860-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 72528A3D72E
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 11:47:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25C047AC1CA
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 10:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05231F192E;
	Thu, 20 Feb 2025 10:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eZCdjTWL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5D31F12E0
	for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2025 10:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740048279; cv=none; b=jaOBIonu0u/IK6MfZBd/MRgmlzkDdxezPq1R4kyGpb9+p83v3/vcznkf/UPe2txScCYan+sqmo/zN2qnwzBSImV1t4rfmhuSeCVKvi2cGQoOd77nrn7RkTt3bQZlImXT+Rp+00LH7X5/acRInF3AoKot/sBIfXpHgAMDTeMXFdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740048279; c=relaxed/simple;
	bh=qu+8w9zOBdBBgReQHw6GWg3P6r8WGpq2DjWauq1ULE8=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=sfV/QCD1ccNisd9SPb544/pDMVODbsD4y7vzhBo6aN55fHDB5Ryqj1+nKz26bkyQrlfswPk48dClET6QKVFbB09L8s+pbVlQmjGniYAkwr4d+8gOCxVscZJKf30A3kkQqwn9rvvxuKLyNRWp4M6IZv+OHgQc+tPydJBvm/vGlms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eZCdjTWL; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38de1a5f039so605476f8f.2
        for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2025 02:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740048275; x=1740653075; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fIB3icGN93QPnZf1vRaNAqs39SQ+kEgkzH8js5x0C8=;
        b=eZCdjTWLpvuPSx9d5Djnhmsc/teX5ZD0L+FUjrsQJh0LR0umlTt8+cgNnTv8b3pRYm
         6zQfrHy475gAP5TSlY/C7xmarBShIM49iXdxlkcx4/F+x8eR/yqKdCCH0+DfgHRQJkdU
         0C1b35SctlMjKEHOf7CvKEmeR/fJO71HMP07u8N7r/8JKMelVM7Hr9XHSaevW7LXY00q
         DxMwqrbtxYYK9MCgpzwNJGfomCP8qMDLVaAqsQIpwfy9ywyElsD5BDmpNh1XOiQPCkCH
         wGE8dQVgAmz15pfT2CwAuWeWeRgFm+d6XrzG6+GAKxIk9gF8GGzN+AUljZoVRaJsbxcF
         V02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740048275; x=1740653075;
        h=content-transfer-encoding:subject:from:cc:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/fIB3icGN93QPnZf1vRaNAqs39SQ+kEgkzH8js5x0C8=;
        b=eWnHY1Ytp6CxfOEyhYVSOcZ4a9d1cjz9+ayteSOBHaiKa1LWq5A92QsGEwk7xk8D9f
         7vflQdxYqzRoTt+29EAswdU9uoNhqSdKa2Ti8L/PqYQvnxkVkAYRe0bnG1CUQEwsXU1k
         13f5GvgcUpe6Us++vrG2o0g1iUjiKq4BbEhfi/0OZlv6pw+o8vtuIeMMfLYDkJq+jHbb
         bnVx3A5XLURTfTn3JKLB/8WuyKum/om3ZRMtFMPB7HCGB2HYJBXHsQsPPneUcnhs8tGo
         HTob8D7dE02U/ao76THT0YYuOdTiDeRvwRbzyO0KOuzIDkKKmU0FEITO+nm6azd0yDM2
         fUPg==
X-Gm-Message-State: AOJu0Yy2rvJ8VJBu2mwlKw6YdmnBnOStZAq/L6LbyRgleWVJSu9VECMO
	FUQj7ouKnXeJD0rucEpijXFeuZqE1II2BO5XxgYqOw1+e57feLfbVXj3LcV7pV+PxOZ7cE3hkY2
	f
X-Gm-Gg: ASbGncsAIaksVD3A/gktb1QthgMwEpmmBcwGPNPjcJyFs4Zny1g0trVPCNgxhdPyGIw
	Y6H1dshrd1j4Qaa9kkiU814jUj4GA/o16BUs2rOgf9gv0ibBrzpFxrGQDst3QAc5htnisn0eYlo
	mgnCdBt3bGRGUe0Hd/h88ReYuGwi/g0kfwh3tbWPzfixM01gS7RzV1H26HGF5MyEjkyt+81GN/2
	nbUz3w+DEpbQEVTw3F35/ohGN/K0MtyUCAXW2A94cbZQzg67tesksfE3q652ej55tbveagnd95h
	A5s8dyVoqPQ3DRU6QDuQ1et38Rs7aXFuk735e34AtF1qxirajR8J4BhDbg==
X-Google-Smtp-Source: AGHT+IFviZb5XCJyfWc9uMqh9oWYcSb7tpN/J8dH3BRLUdqWxwgK3bBVg/viF5GqMCmFGc3K9yhdYg==
X-Received: by 2002:a5d:6951:0:b0:38d:c44a:a64b with SMTP id ffacd0b85a97d-38f33f566f7mr20559147f8f.48.1740048274944;
        Thu, 20 Feb 2025 02:44:34 -0800 (PST)
Received: from ?IPV6:2001:a61:136c:cf01:505d:b6ac:9103:aec6? ([2001:a61:136c:cf01:505d:b6ac:9103:aec6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259fdce7sm20456320f8f.96.2025.02.20.02.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 02:44:34 -0800 (PST)
Message-ID: <45365f62-f6bb-4e00-8946-84b115de0184@suse.com>
Date: Thu, 20 Feb 2025 11:44:34 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alan Stern <stern@rowland.harvard.edu>
Content-Language: en-US
Cc: USB list <linux-usb@vger.kernel.org>
From: Oliver Neukum <oneukum@suse.com>
Subject: design of usb_lock_device_for_reset()
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

looking at this code it struck me as not really good
at its purpose, if there is ever contention.
If we really run in the repeat loop

         while (!usb_trylock_device(udev)) {

                 /* If we can't acquire the lock after waiting one second,
                  * we're probably deadlocked */

because somebody else is resetting the device, what
are we really waiting for? Do we really want to even
reset the device in that case? That has just happened.

It seems to me that in that case we should really wait
the reset to proceed and then report its outcome.
When we use it, for example in uas:

static int uas_eh_device_reset_handler(struct scsi_cmnd *cmnd)
{
         struct scsi_device *sdev = cmnd->device;
         struct uas_dev_info *devinfo = sdev->hostdata;
         struct usb_device *udev = devinfo->udev;
         unsigned long flags;
         int err;

         err = usb_lock_device_for_reset(udev, devinfo->intf);
         if (err) {
                 shost_printk(KERN_ERR, sdev->host,
                              "%s FAILED to get lock err %d\n", __func__, err);
                 return FAILED;
         }

We happily wait for the first reset to take place, only then to do it again,
or, worse, we wait for shorter than the timeout for the control
message we use to perform the actual reset:

         unsigned long jiffies_expire = jiffies + HZ;

Now, this may just not be important enough to change, but
it really does not look good. What do you think?

	Regards
		Oliver


