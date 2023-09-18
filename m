Return-Path: <linux-usb+bounces-337-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 235587A4F9C
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 18:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D138E28175D
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 16:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8047D21107;
	Mon, 18 Sep 2023 16:47:43 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6233810E5
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 16:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3ACDC433C7;
	Mon, 18 Sep 2023 16:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695055662;
	bh=Offg6VmtFe2UBByUqEhSGUwj6q3tNukHJa7EtuPg/UE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SfmpFokFWz+1524hZtLpJ7zeYbI902PzYuG/+6N96zVgQWjmAsmsjrUqQaewh+kOj
	 8hfV9Rt1PQVZcFai8A+RqKiDo2LNo6AUCGpwljNQoAPchhFxgtRyRxpoBkygHVoGfY
	 iMRarhhfX7ThGSQTLJQ2saAh7xn6wI2pIbhzQxZCb1CLGm2KhZb26lNmePFv9zs3l0
	 Vw73HQ6L4/XH6bGA4QGFiKnzQ6rNz9M7Yz9dAM+YI+fq/7Wl8PVKWhVl0eA+1Oz8Xk
	 mb0LMwINAOiMQCByIQ7xBdm4suF54dGa9YH/42BaXwMNViy23JrZQG8R7D5rWspNDT
	 TwpzGrIpVmfXg==
Date: Mon, 18 Sep 2023 12:47:41 -0400
From: Sasha Levin <sashal@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Dan Drown <dan-netdev@drown.org>, Oliver Neukum <oneukum@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.4 24/25] usb: cdc-acm: move ldisc dcd
 notification outside of acm's read lock
Message-ID: <ZQh/LTtayWgQ/BrS@sashalap>
References: <20230909003715.3579761-1-sashal@kernel.org>
 <20230909003715.3579761-24-sashal@kernel.org>
 <ZP7bkRc-1U8-M6X1@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ZP7bkRc-1U8-M6X1@hovoldconsulting.com>

On Mon, Sep 11, 2023 at 11:19:13AM +0200, Johan Hovold wrote:
>On Fri, Sep 08, 2023 at 08:37:12PM -0400, Sasha Levin wrote:
>> From: Dan Drown <dan-netdev@drown.org>
>>
>> [ Upstream commit f72ae60881ff685004d7de7152517607fcd9968f ]
>>
>> dcd_change notification call moved outside of the acm->read_lock
>> to protect any future tty ldisc that calls wait_serial_change()
>>
>> Signed-off-by: Dan Drown <dan-netdev@drown.org>
>> Acked-by: Oliver Neukum <oneukum@suse.com>
>> Link: https://lore.kernel.org/r/ZN1zV/zjPgpGlHXo@vps3.drown.org
>> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> ---
>>  drivers/usb/class/cdc-acm.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
>> index 11da5fb284d0a..ca51230f44409 100644
>> --- a/drivers/usb/class/cdc-acm.c
>> +++ b/drivers/usb/class/cdc-acm.c
>> @@ -318,6 +318,16 @@ static void acm_process_notification(struct acm *acm, unsigned char *buf)
>>  		}
>>
>>  		difference = acm->ctrlin ^ newctrl;
>> +
>> +		if ((difference & USB_CDC_SERIAL_STATE_DCD) && acm->port.tty) {
>> +			struct tty_ldisc *ld = tty_ldisc_ref(acm->port.tty);
>> +			if (ld) {
>> +				if (ld->ops->dcd_change)
>> +					ld->ops->dcd_change(acm->port.tty, newctrl & USB_CDC_SERIAL_STATE_DCD);
>> +				tty_ldisc_deref(ld);
>> +			}
>> +		}
>> +
>>  		spin_lock_irqsave(&acm->read_lock, flags);
>>  		acm->ctrlin = newctrl;
>>  		acm->oldcount = acm->iocount;
>
>This is a fix for a commit in 6.6-rc1 (3b563b901eef ("usb: cdc-acm: add
>PPS support")) so a backport of it makes no sense.
>
>Please drop.

Done, thanks!

-- 
Thanks,
Sasha

