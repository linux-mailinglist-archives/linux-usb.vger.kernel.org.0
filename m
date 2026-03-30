Return-Path: <linux-usb+bounces-35685-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKkvNYeXymlx+QUAu9opvQ
	(envelope-from <linux-usb+bounces-35685-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 17:32:23 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4278035DE76
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 17:32:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E3133072FD5
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 15:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB7F2340A6B;
	Mon, 30 Mar 2026 15:25:55 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m1973183.qiye.163.com (mail-m1973183.qiye.163.com [220.197.31.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14AE344D83;
	Mon, 30 Mar 2026 15:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774884355; cv=none; b=T672jR4tQLbb/Ic1YNqronfG0KoYCy6lJq6Wkzt2/lVfyZvDa+6F7XamZTz4J8+uRGluaY++D0mTua/Nurej8K+s5Rfwd7ZPPFhtF/qC1SwVf3u18KXoiYjDiVvPkc5anhM8TzINQ8gYjQY6PbJyGsCaO+7MdGuapNSbP5nYVls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774884355; c=relaxed/simple;
	bh=h8DMioMnVjCDlnbaWmCNYw/zE8XpID+SrXDorXunYKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ExgxpHJRFkWArC5ZJnUozgOhSANFjBiQI78raJ6S0yIg2ZsOaDchG6vqsmqBsgfQgtiZrZTTYxwUoBnw/AjgfS4DjlfrV/Tq6rQ59ObWldmAnEXpUz00sR0qGvFBMn8rG/3u32ZkXCgCzoSqjR+oMaur9ckCQm7mNXE3U7CalAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=autochips.com; spf=pass smtp.mailfrom=autochips.com; arc=none smtp.client-ip=220.197.31.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=autochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=autochips.com
Received: from yongchao.wu?autochips.com (localhost [127.0.0.1])
	by smtp.qiye.163.com (Hmail) with ESMTP id 38d815026;
	Mon, 30 Mar 2026 23:25:38 +0800 (GMT+08:00)
From: =?UTF-8?B?5ZC05rC46LaF?= <yongchao.wu@autochips.com>
To: "'Peter Chen \(CIX\)'" <peter.chen@kernel.org>
Cc: "'Pawel Laszczak'" <pawell@cadence.com>,
	"'Roger Quadros'" <rogerq@kernel.org>,
	"'Greg Kroah-Hartman'" <gregkh@linuxfoundation.org>,
	<linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: cdns3: gadget: fix resource leak on gadget init failure
Date: Mon, 30 Mar 2026 23:25:38 +0800
Message-ID: <00b201dcc059$766a90f0$633fb2d0$@autochips.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdzAWUjqcbUyeMJ0QAG8Ks9BhRQ5+A==
Content-Language: zh-cn
X-HM-Tid: 0a9d3f59bc2c0337kunmdb3030629ded
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHU4ZVh9ITRhKHUJMHU4aGlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlJSUhVSU9PVUNCVUlPTVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0
	tVSkJLS1kG
X-Spamd-Result: default: False [1.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[autochips.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	FAKE_REPLY(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35685-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongchao.wu@autochips.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:email,cadence.com:email,autochips.com:email,autochips.com:mid]
X-Rspamd-Queue-Id: 4278035DE76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-30, Peter Chen wrote:
> I have two questions:
> - What exactly resource is leaked?
> - Do you call cdns_drd_host_on before setup host?

For the first question:
The DRD hardware is left in gadget mode while software state remains
INACTIVE, creating hardware/software state inconsistency.
I will update the commit title to "usb: cdns3: gadget: fix state
inconsistency on gadget init failure" to better reflect this.

For the second question:
When gadget start fails, the role state is not set to
CDNS_ROLE_STATE_ACTIVE. When switching to host via:
  echo host > /sys/class/usb_role/13180000.usb-role-switch/role

The flow is:
  cdns_role_set()
    -> cdns_role_stop()
         if (cdns->roles[role]->state =3D=3D CDNS_ROLE_STATE_INACTIVE)
             return;  // Skips cleanup because state is still INACTIVE

This violates the DRD controller design specification (Figure22),
which requires returning to idle state before switching roles.

Error logs:
[  516.440698][ T4992] configfs-gadget 13180000.usb: failed to start g1: =
-19
[  516.442035][ T4992] cdns-usb3 13180000.usb: Failed to add gadget
[  516.443278][ T4992] cdns-usb3 13180000.usb: set role 2 has failed
...
echo host > /sys/class/usb_role/13180000.usb-role-switch/role
[ 1301.375722][ T5000] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
[ 1301.377716][ T5000] Internal error: synchronous external abort: =
96000010 [#1] PREEMPT SMP
...

I will prepare v2 with Fixed-by tag and Cc to stable tree.

-----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
=E5=8F=91=E4=BB=B6=E4=BA=BA: Peter Chen (CIX) <peter.chen@kernel.org>=20
=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2026=E5=B9=B43=E6=9C=8830=E6=97=A5 =
13:52
=E6=94=B6=E4=BB=B6=E4=BA=BA: Yongchao Wu <yongchao.wu@autochips.com>
=E6=8A=84=E9=80=81: Pawel Laszczak <pawell@cadence.com>; Roger Quadros =
<rogerq@kernel.org>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>; =
linux-usb@vger.kernel.org; linux-kernel@vger.kernel.org
=E4=B8=BB=E9=A2=98: Re: [PATCH] usb: cdns3: gadget: fix resource leak on =
gadget init failure

On 26-03-28 23:15:50, Yongchao Wu wrote:
> When cdns3_gadget_start() fails, the DRD gadget is left in an=20
> initialized state, causing a resource leak. When switching to host=20
> mode, the stale state triggers a synchronous external abort in=20
> xhci_gen_setup(), leading to kernel panic:
>=20
> [  1301.377716][ T5000][E] Internal error: synchronous external abort: =

> 96000010 [#1] PREEMPT SMP [  1301.382485][ T5000][I] pc :=20
> xhci_gen_setup+0xa4/0x408 [  1301.393391][ T5000][I] backtrace:
>     ...
>     xhci_gen_setup+0xa4/0x408    <-- CRASH
>     xhci_plat_setup+0x44/0x58
>     usb_add_hcd+0x284/0x678
>     ...
>     cdns_role_set+0x9c/0xbc        <-- Role switch
>=20
> Fix by calling cdns_drd_gadget_off() in the error path to properly=20
> clean up the DRD gadget state. This prevents both the resource leak=20
> and the kernel panic during role switching.
>=20

Good catch.

I have two questions:
- What exactly resource is leaked?
- Do you call cdns_drd_host_on before setup host?

Besides, you may add Fixed-by tag and Cc to stable tree.

Peter

> Signed-off-by: Yongchao Wu <yongchao.wu@autochips.com>
> ---
>  drivers/usb/cdns3/cdns3-gadget.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/usb/cdns3/cdns3-gadget.c=20
> b/drivers/usb/cdns3/cdns3-gadget.c
> index d59a60a16..4cc3f2ffb 100644
> --- a/drivers/usb/cdns3/cdns3-gadget.c
> +++ b/drivers/usb/cdns3/cdns3-gadget.c
> @@ -3428,6 +3428,7 @@ static int __cdns3_gadget_init(struct cdns =
*cdns)
>  	ret =3D cdns3_gadget_start(cdns);
>  	if (ret) {
>  		pm_runtime_put_sync(cdns->dev);
> +		cdns_drd_gadget_off(cdns);
>  		return ret;
>  	}
> =20
> --
> 2.43.0
>=20
>=20

--=20

Best regards,
Peter


