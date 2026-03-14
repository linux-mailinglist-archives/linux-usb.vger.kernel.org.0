Return-Path: <linux-usb+bounces-34777-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5GrHNdLJtGnLswAAu9opvQ
	(envelope-from <linux-usb+bounces-34777-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 03:37:06 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D1228B672
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 03:37:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E72023049519
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 02:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBBA42868AB;
	Sat, 14 Mar 2026 02:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=h-partners.com header.i=@h-partners.com header.b="WGHFCBSB"
X-Original-To: linux-usb@vger.kernel.org
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106C31CDFD5
	for <linux-usb@vger.kernel.org>; Sat, 14 Mar 2026 02:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773455822; cv=none; b=kfE7VgjnaZn0/tOzPToX/CkCr8Qt9nF0TkGB2Rl4ollFPdckEMtx21NfQhWf7K713sUIOlvkZcUGC65ufW+PoMPOg8hajh4LNMvhBSQ8KwVMMTQJNYcMD2P8gFSBIuL4oR+oXdyD7Z1ldtbs+UZmsFEJ8dU1n6N0gDRclfiewRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773455822; c=relaxed/simple;
	bh=L7333wQLIVpp/u8HyBiA6yKo3VZoFLhYgxtocKGAhHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iUhcM8hxalhm4peyeNQQdJ+3wnWguW2tUWL2CWFYsYoiQuNXVR8RBmeAIr3Wc2EW3TRqUMN+gokPS68shiCTetPiUjli6nGF9GdDCzQ2dLoR1PQ1Il+cSATogWuLiiFe/Oo6H3YwbYNlWnWnU4Jrb6LXPhtvNfHpLGtGFPgClZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=h-partners.com; dkim=pass (1024-bit key) header.d=h-partners.com header.i=@h-partners.com header.b=WGHFCBSB; arc=none smtp.client-ip=113.46.200.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=h-partners.com
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=hpjU/ybfSttR1uMZDy/u0ekVYor0pikJhgzdjib27Cg=;
	b=WGHFCBSBvddPOic5Ogh7caoS1yZnSckUrU7sEPa37RP8iQwXIWbHvaVbEjBeRwX8cRc+8nSOR
	6BktHql48hrF2l5U8mIGKHGu7LnSUJ1Do1KTrMlZ5L28rXgz7iCy1PbDMB1sS0OJzotI0UkRpfk
	T+NscaoDVFlPiLZc+/D6hD8=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4fXljn5FS9zKm5G;
	Sat, 14 Mar 2026 10:31:57 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 58CFA40539;
	Sat, 14 Mar 2026 10:36:55 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 14 Mar 2026 10:36:55 +0800
Received: from [10.67.121.59] (10.67.121.59) by kwepemn100009.china.huawei.com
 (7.202.194.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Sat, 14 Mar
 2026 10:36:54 +0800
Message-ID: <53c62981-4953-44b1-b388-af9115a743ed@huawei.com>
Date: Sat, 14 Mar 2026 10:36:54 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: use BIT macro
To: Oliver Neukum <oneukum@suse.com>, <mathias.nyman@intel.com>,
	<gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>
References: <20260312150649.2138749-1-oneukum@suse.com>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <20260312150649.2138749-1-oneukum@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemn100009.china.huawei.com (7.202.194.112)
X-Spamd-Result: default: False [-0.16 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[huawei.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[h-partners.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[h-partners.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34777-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lihuisong@huawei.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 16D1228B672
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Change below comment, then can add
Acked-by: lihuisong@huawei.com


On 3/12/2026 11:06 PM, Oliver Neukum wrote:
> We have the macro. Use it.
>
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>   drivers/usb/host/xhci.h | 123 ++++++++++++++++++++--------------------
>   1 file changed, 62 insertions(+), 61 deletions(-)
<...>
>   /* imod bitmasks */
>   /*
> @@ -267,7 +268,7 @@ struct xhci_intr_reg {
>    * bit 3 - Event Handler Busy (EHB), whether the event ring is scheduled to be serviced by
>    * a work queue (or delayed service routine)?
>    */
> -#define ERST_EHB		(1 << 3)
> +#define ERST_EHB		BIT(3)
>   /* bits 63:4 - Event Ring Dequeue Pointer */
>   #define ERST_PTR_MASK		GENMASK_ULL(63, 4)
>   
> @@ -356,15 +357,15 @@ struct xhci_slot_ctx {
>   #define GET_DEV_SPEED(n) (((n) & DEV_SPEED) >> 20)
>   /* bit 24 reserved */
>   /* Is this LS/FS device connected through a HS hub? - bit 25 */
> -#define DEV_MTT		(0x1 << 25)
> +#define DEV_MTT		BIT(25)
>   /* Set if the device is a hub - bit 26 */
> -#define DEV_HUB		(0x1 << 26)
> +#define DEV_HUB		BIT(26)
>   /* Index of the last valid endpoint context in this device context - 27:31 */
> -#define LAST_CTX_MASK	(0x1f << 27)
> +#define LAST_CTX_MASK	BIT(27)
here is wrong.
>   #define LAST_CTX(p)	((p) << 27)
>   #define LAST_CTX_TO_EP_NUM(p)	(((p) >> 27) - 1)
> -#define SLOT_FLAG	(1 << 0)
> -#define EP0_FLAG	(1 << 1)
> +#define SLOT_FLAG	BIT(0)
> +#define EP0_FLAG	BIT(1)
>   


