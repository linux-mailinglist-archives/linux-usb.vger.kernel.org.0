Return-Path: <linux-usb+bounces-34573-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KN5JvV+sWm5CwAAu9opvQ
	(envelope-from <linux-usb+bounces-34573-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 15:40:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C141F265946
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 15:40:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5D5B30427D1
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 14:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9B83B5312;
	Wed, 11 Mar 2026 14:27:04 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from zg8tmja5ljk3lje4mi4ymjia.icoremail.net (zg8tmja5ljk3lje4mi4ymjia.icoremail.net [209.97.182.222])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D75A36C9FC;
	Wed, 11 Mar 2026 14:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.97.182.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239223; cv=none; b=V6WPkx4C13+OiMxXOP2k8hRwNFJ+XgSDy/OqqHSAZB2hzwLAHq0rsxAm767spuS3MezgvsmHDnaMQNRMcZAj1yAiCgeqjiXduVbUvtgjCKZXSqIJXFlBR3/RvmXsnVcss7T/Lefb4EIcHJw7idg5hriNs+LfW49v64KjUyxMnhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239223; c=relaxed/simple;
	bh=qsc0nN/4RxQMlqWMx3JHaohcUF60lS5B7vmkWkNl7SA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Nu6A6TNE8NpwXBaTW/5Ge8ZiSaFjbfygRf3yTaN5A6tMvecNl+tjE4cGi1OT1sxDT+G/6axevZTlvA93+EGV0aCrFAhK0rJiJcZqg3/YlQrnP/+vuMFKC2r89YXQIh2oJD7u8utYqen+pYMSlF98DAvhWSJRJg6YUqOwg8IjjBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=209.97.182.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [61.153.121.51])
	by mtasvr (Coremail) with SMTP id _____wDXc_ake7FpNsQBAA--.4856S3;
	Wed, 11 Mar 2026 22:26:45 +0800 (CST)
Received: from smtpclient.apple (unknown [61.153.121.51])
	by mail-app2 (Coremail) with SMTP id zC_KCgCnDD+je7Fp+CA4Bg--.57544S2;
	Wed, 11 Mar 2026 22:26:43 +0800 (CST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH] USB: serial: opticon: fix UAF in write callback during
 port removal
From: Fan Wu <12321260@zju.edu.cn>
In-Reply-To: <2026031137-amply-cardboard-581c@gregkh>
Date: Wed, 11 Mar 2026 22:26:33 +0800
Cc: Fan Wu <fanwu01@zju.edu.cn>,
 Johan Hovold <johan@kernel.org>,
 linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <493E1779-94BC-49B3-80CB-3AE5FDD3D045@zju.edu.cn>
References: <aa_c0B9E7MPm_yqL@hovoldconsulting.com>
 <20260309142757.589802-1-fanwu01@zju.edu.cn>
 <20260310170424.19817-1-fanwu01@zju.edu.cn>
 <2026031137-amply-cardboard-581c@gregkh>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-CM-TRANSID:zC_KCgCnDD+je7Fp+CA4Bg--.57544S2
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?OOxAawXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfncp7Oa4RjKRyNF7NkJaR8oLeOByjrhV9s/EO96xJD/raT9CtCGqW5x+RN8yiVO4GqluA
	2X0GAexbH3l+fvgkMzYcmLAfi45W/jsSQAs2wsTu
X-Coremail-Antispam: 1Uk129KBj9xXoW7XFWDury5WF4xJryxKF43twc_yoWkXwb_WF
	WkCa4kAr1vqayfAws8KF1YqrZxtayxXF17X3s5JrsIq3s5AFZ0grZakr95AF15J3ykAFnI
	krn0vanxCr1SqosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb-AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6x
	kI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v2
	6r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2
	Ij64vIr41lF7xvr2IYc2Ij64vIr40E4x8a64kEw24l42xK82IYc2Ij64vIr41l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
	WUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
	Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rV
	WUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4U
	YxBIdaVFxhVjvjDU0xZFpf9x07jnKsUUUUUU=
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DMARC_NA(0.00)[zju.edu.cn];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34573-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.954];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[12321260@zju.edu.cn,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	APPLE_MAILER_COMMON(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: C141F265946
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


> On Mar 11, 2026, at 20:14, Greg Kroah-Hartman =
<gregkh@linuxfoundation.org> wrote:
> On Tue, Mar 10, 2026 at 05:04:24PM +0000, Fan Wu wrote:
>> On Tue, Mar 10, 2026 at 09:56:48 +0100, Johan Hovold wrote:
>>> How was this potential issue found? Are you using some kind of LLM =
or
>>> other tool?
>>=20
>> Hi Johan,
>>=20
>> Thanks for the explanation. You're right =E2=80=94 I missed the =
lifecycle guarantees
>> provided by usb_serial_disconnect(), and since opticon_close() =
already handles
>> the URB cleanup, this report is a false positive.
>>=20
>> I'm currently researching static analysis techniques (CodeQL combined =
with LLM
>> assistance) for detecting UAF bugs, particularly around cross-entry =
lifetimes.
>> In this case, the analysis missed the subsystem-level guarantee that =
close runs
>> before remove.
>=20
> As is required, you always have to document this type of thing in the
> changelog text.
>=20
> thanks,
>=20
> greg k-h

Hi Johan,

Thanks for the reminder. Understood =E2=80=94 I'll make sure to =
explicitly document the=20
search method and tool assistance in the changelog for any future =
patches.

Best regards,
Fan Wu=


