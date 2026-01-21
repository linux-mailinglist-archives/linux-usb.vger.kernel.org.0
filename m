Return-Path: <linux-usb+bounces-32573-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJsSOs9lcGkVXwAAu9opvQ
	(envelope-from <linux-usb+bounces-32573-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 06:36:15 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B214351962
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 06:36:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2AC0D42E24E
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 05:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86955426682;
	Wed, 21 Jan 2026 05:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical-com.20230601.gappssmtp.com header.i=@canonical-com.20230601.gappssmtp.com header.b="KjmsFLCZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86197425CE3
	for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 05:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768973753; cv=pass; b=qOID3M7beskGWx0ZohAJK2bGzcjQMCo8sAUm0N0CECrQ7kd+G97A7aVKirKx+3EcG9S5ygN/trSLJAezr6C1HzatyV76FjhLIUXHWeFepTB0IyeazgaR0c7QZXHgqVugsJv3TrjJPpgGi8cUsiHBKfnkDGpBj3QFsrfcmuspgpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768973753; c=relaxed/simple;
	bh=Y5pBP8KooY+8ViF96DJTU6waaOXTfIWGq5ZTLHsz4lE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=hvN/GYN9bSA8wBcOHqxQXzXjSUN8pPwytWOKAO8ImDzpHejWHk+4qF/fP3bSUCLlrMBcm3zFWhkLVq22D0Il1o7j28igpNHn7q8lUwqtAJFkqvNpbElfFyTY9Ph+8H/8c+JdxVMHVtwxpf5D4+B/54qwfD2JBj8pnaMk7UCiy3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=canonical-com.20230601.gappssmtp.com header.i=@canonical-com.20230601.gappssmtp.com header.b=KjmsFLCZ; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59b6c13b68dso473639e87.0
        for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 21:35:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768973739; cv=none;
        d=google.com; s=arc-20240605;
        b=hm7Fv37/zAi4K8L7MNjMfJVOh6pSXynHmqEiNbu6MsCowL7sVomue97V1n70OuhyLR
         GyFuV1x3b+yePluZrhqVc7Rmfoege2L/3z3dtRnpbxv3fUSIqT0xhrxVLMkAvJdeCuD+
         9EKUBd3yxtkGk2lRqDeIh1P7TdINu5MPpKJ+RvT3c1e8fdJfywVn0DtGpGrjollhdxsg
         ChWIYCyk0t3gUfTuEJfbclXn/iHCjs7SeJqtyx9whi7w6CB1htT+UKSq7o3P2cLJqi07
         k5TvPlbpiNX357cMwwxjD8dIayNDNc40r+5hD6Uu5mc9A7BzM96ew8AtrokSDSg1K8OP
         sq4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AB/UUD7XlXGFS18B0Cwr0L2pWkzcI51IW6jTr8PVtEA=;
        fh=Dmn1fBP5NOyoeXPcKaJ9ginedpf4zy5CnU1tvRGRIAM=;
        b=ld3S1Fi8ud5R0voRLg2X8EyHDWmA84R2PUwaCUPtNq9yNd7kzyWPusUxISXY7DH36e
         +NR8huboztmHjYL0B8vVnZEpDgo07DAdsHpa3cSLkPDkRl2oJepkc6VOG905ZytNj6CW
         qRAdLhNcSYGNEn91/1o4ofaz5ZnVSditM28ZCBrY6SYdl6SwpOmjyfnHJeBuuTEZRfJg
         +KYluRE69XZ806HLrOD+6kKlz/3MvimzbAlK4Wa5XA/czEobNihxH1vRcbDZ8uvOrLQP
         c9GjHNK0ewVQLt5tvMxRdc+TM6zjOD/w54uRrGCI1j3545Exhn6Ca2ml9gsHFIBdjYNO
         Tnrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=canonical-com.20230601.gappssmtp.com; s=20230601; t=1768973739; x=1769578539; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AB/UUD7XlXGFS18B0Cwr0L2pWkzcI51IW6jTr8PVtEA=;
        b=KjmsFLCZPtfj7vy047PhE3fC2gClC2gCN95RgGFIqe5swRLr3xkd2W57v5BlWpPiAy
         mmBq8FHwiKegqD3D1BtDUlNtL7CW7GCtiZSBBV1pky7RDlR8Rp9EaQL1v1FVZItFv6PI
         q+F4O/gevtT8C/rmuJSUw1q8lfSI9PcnXsUVUuLd0I4e0xk53kP5ZdIUKydAkYxfQLlI
         xYLVl8Q2qQz7ublTrTYZem0do8YYhuN/Eex0qi+XrjIcVp1hPfvHTsZdiFU0L/7lwxwC
         34PZUEnhAKkmi3224Aq5M8kktO4P2PPaG8qsTQJoVje/3OSMm5559Pso1K87A8sDEV1z
         KB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768973739; x=1769578539;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AB/UUD7XlXGFS18B0Cwr0L2pWkzcI51IW6jTr8PVtEA=;
        b=KN7oVizUdW4fYQ/w9xvYDJyaTGOCxRmsaixSPDWsivdcike1l1CHPZe3LDIgnXHRZd
         NEpWRiE9nSXY6s2GtUZ3ROftTs8i8gHLS9iaCGfY9KTzi1me7eFhT+J6X0kXAwqw7aUn
         Y7WWquHl8TZ4cT26iTQWhjysOHpB7p+JgtNONJbjhv0uFnvawMDLM+GGvI4pR59Yop0B
         37l7+TuaS/gmUccRYYp8JhZZTu4PD1vGOm44VbCcu5eE551mNXJnVA9YOEIT4r3bUu3s
         6O2n1jdy/n6Unb8WkptKt658DeAfCOKFqhuiRwtCGnprN4l1DWlohwFQDjsv1erXDNdm
         V4dg==
X-Forwarded-Encrypted: i=1; AJvYcCUnOQ7nB1H1ctY48VmD+QXOCUG+K2hwBJTJx4hhC1CJ22XIpRoHrUKmaEeap2qo9D0qXBhY9UgpUlE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUPqDL0fJRWEPDgIUnu9kPo30k4hNmudkYY54/P7bX0APCh2QY
	0sXFzeSChxVouGoHpY1UHEb5PoUXUAgyEdagcc1M48FN5MiLdDhs+Di9LNNCAHmUvlKmSW6/nA5
	HKkoeFyjlil533C1CSio7VQ+4pqL50wI=
X-Gm-Gg: AZuq6aKZXWmuNGM7vUMyoXtBzm6KGkHtkSQ93e7ltW2wLMrMGXoZYI8cMU1KrrY8e6Q
	TTNOgWANErxTIbf/A2qZ/E2iHuW+BTzortxBbvlAfK8Fws5074JDse6YbAll5MofgYsmOOQKsPJ
	VX0OoOTZG1QIwP1vsawjbo9dfXvQqXY1hf+kCNjDjmOpydJcNsi9clXSVYIn476yclI33bx02Hi
	x0KE8CCHmpWAcq/KLGmiiWh75zKKjXllPZ6p80sFY2VtbspvE5Om8OUnETiQezceltDR1+d
X-Received: by 2002:a05:6512:3e0b:b0:59c:bf32:26fb with SMTP id
 2adb3069b0e04-59cbf322736mr4057526e87.2.1768973739093; Tue, 20 Jan 2026
 21:35:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121052744.233517-1-acelan.kao@canonical.com>
In-Reply-To: <20260121052744.233517-1-acelan.kao@canonical.com>
From: AceLan Kao <acelan.kao@canonical.com>
Date: Wed, 21 Jan 2026 13:35:27 +0800
X-Gm-Features: AZwV_Qgi1MhPf8UgVofM2hLdyJiArgG9-i66VAqF2ZVTBAExlyL2wqpSak3CNM0
Message-ID: <CAMz9Wg-_0g2DrkjiUfyGwfYg_WgGTp9wiKoA_nR-AWtm1ixX4A@mail.gmail.com>
Subject: Re: [PATCH] thunderbolt: Fix PCIe device enumeration with delayed rescan
To: Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.54 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : No valid SPF, DKIM not aligned (relaxed),reject];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[canonical-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-32573-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[canonical-com.20230601.gappssmtp.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[acelan.kao@canonical.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:email,canonical.com:url,canonical-com.20230601.gappssmtp.com:dkim,acelan.idv.tw:url,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,work.work:url,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B214351962
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Chia-Lin Kao (AceLan) <acelan.kao@canonical.com> =E6=96=BC 2026=E5=B9=B41=
=E6=9C=8821=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=881:27=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> PCIe devices behind Thunderbolt tunnels may fail to enumerate when
> spurious hotplug events prevent pciehp from detecting link-up.
>
> Root cause:
>
> Spurious unplug events occur immediately after tunnel activation:
>
>   [  932.438] thunderbolt: acking hot unplug event on 702:2
>   [  932.852] thunderbolt: PCIe Up path activation complete
>   [  932.855] thunderbolt: hotplug event for upstream port 702:2
>             (unplug: 0)
>   [  932.855] thunderbolt: hotplug event for upstream port 702:2
>             (unplug: 1)
>
> These events disrupt pciehp timing, causing device enumeration to fail
> ~70% of the time on affected hardware. Manual PCI rescan succeeds,
> proving devices are present and functional on the bus.
>
> Solution:
>
> Schedule delayed work (300ms) after tunnel activation to:
> 1. Check if pciehp successfully enumerated devices (device count increase=
d)
> 2. If not, trigger pci_rescan_bus() to discover devices manually
> 3. Log results for observability
>
> The delayed work approach is non-blocking and only rescans when actually
> needed, avoiding overhead on systems where pciehp works correctly.
>
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> ---
> Logs: https://people.canonical.com/~acelan/bugs/tbt_storage/
> merged.out.bad: Plugged-in TBT storage, but eventually fails to enumerate
> merged.out.good: Plugged-in TBT storage, and successfully enumerates
> merged.out.patched: Plugged-in TBT storage, it should fail without this
>                     patch, but it works now
> ---
>  drivers/thunderbolt/tb.c | 95 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
>
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 293fc9f258a5c..1cfc9a265c453 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -11,6 +11,7 @@
>  #include <linux/delay.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/platform_data/x86/apple.h>
> +#include <linux/pci.h>
>
>  #include "tb.h"
>  #include "tb_regs.h"
> @@ -18,6 +19,7 @@
>
>  #define TB_TIMEOUT             100     /* ms */
>  #define TB_RELEASE_BW_TIMEOUT  10000   /* ms */
> +#define TB_PCIEHP_ENUMERATION_DELAY 300        /* ms */
>
>  /*
>   * How many time bandwidth allocation request from graphics driver is
> @@ -83,6 +85,16 @@ struct tb_hotplug_event {
>         int retry;
>  };
>
> +/* Delayed work to verify PCIe enumeration after tunnel activation */
> +struct tb_pci_rescan_work {
> +       struct delayed_work work;
> +       struct tb *tb;
> +       struct pci_bus *bus;
> +       int devices_before;
> +       u64 route;
> +       u8 port;
> +};
> +
>  static void tb_scan_port(struct tb_port *port);
>  static void tb_handle_hotplug(struct work_struct *work);
>  static void tb_dp_resource_unavailable(struct tb *tb, struct tb_port *po=
rt,
> @@ -90,6 +102,60 @@ static void tb_dp_resource_unavailable(struct tb *tb,=
 struct tb_port *port,
>  static void tb_queue_dp_bandwidth_request(struct tb *tb, u64 route, u8 p=
ort,
>                                           int retry, unsigned long delay)=
;
>
> +static void tb_pci_rescan_work_fn(struct work_struct *work)
> +{
> +       struct tb_pci_rescan_work *rescan_work =3D
> +               container_of(work, typeof(*rescan_work), work.work);
> +       struct tb *tb =3D rescan_work->tb;
> +       struct pci_bus *bus =3D rescan_work->bus;
> +       int devices_after =3D 0;
> +       struct pci_dev *dev;
> +       struct tb_switch *sw;
> +       struct tb_port *port;
> +
> +       mutex_lock(&tb->lock);
> +
> +       sw =3D tb_switch_find_by_route(tb, rescan_work->route);
> +       if (!sw) {
> +               tb_dbg(tb, "Switch at route %llx disappeared, skipping re=
scan\n",
> +                      rescan_work->route);
> +               goto out_unlock;
> +       }
> +
> +       port =3D &sw->ports[rescan_work->port];
> +
> +       pci_lock_rescan_remove();
> +       for_each_pci_dev(dev)
> +               devices_after++;
> +       pci_unlock_rescan_remove();
> +
> +       if (devices_after > rescan_work->devices_before) {
> +               tb_port_dbg(port, "pciehp enumerated %d new device(s)\n",
> +                           devices_after - rescan_work->devices_before);
> +       } else {
> +               tb_port_info(port, "pciehp failed to enumerate devices, t=
riggering rescan\n");
> +
> +               pci_lock_rescan_remove();
> +               pci_rescan_bus(bus);
> +
> +               devices_after =3D 0;
> +               for_each_pci_dev(dev)
> +                       devices_after++;
> +               pci_unlock_rescan_remove();
> +
> +               if (devices_after > rescan_work->devices_before)
> +                       tb_port_info(port, "rescan found %d new device(s)=
\n",
> +                                    devices_after - rescan_work->devices=
_before);
> +               else
> +                       tb_port_warn(port, "no devices found even after r=
escan\n");
> +       }
> +
> +       tb_switch_put(sw);
> +out_unlock:
> +       mutex_unlock(&tb->lock);
> +       kfree(rescan_work);
> +}
> +
>  static void tb_queue_hotplug(struct tb *tb, u64 route, u8 port, bool unp=
lug)
>  {
>         struct tb_hotplug_event *ev;
> @@ -2400,6 +2466,35 @@ static int tb_tunnel_pci(struct tb *tb, struct tb_=
switch *sw)
>                 tb_sw_warn(sw, "failed to connect xHCI\n");
>
>         list_add_tail(&tunnel->list, &tcm->tunnel_list);
> +
> +       /* Verify pciehp enumeration; trigger rescan if needed */
> +       if (tb->nhi && tb->nhi->pdev && tb->nhi->pdev->bus) {
> +               struct pci_bus *bus =3D tb->nhi->pdev->bus;
> +               struct pci_bus *scan_bus =3D bus->parent ? bus->parent : =
bus;
> +               struct tb_pci_rescan_work *rescan_work;
> +               struct pci_dev *dev;
> +               int devices_before =3D 0;
> +
> +               pci_lock_rescan_remove();
> +               for_each_pci_dev(dev)
> +                       devices_before++;
> +               pci_unlock_rescan_remove();
> +
> +               rescan_work =3D kmalloc_obj(rescan_work, GFP_KERNEL);
Sorry, didn't re-check after checkpatch modified it.
kmalloc_obj() is undefined here.
I'll submit v2 later.

> +               if (!rescan_work)
> +                       return 0;
> +
> +               rescan_work->tb =3D tb;
> +               rescan_work->bus =3D scan_bus;
> +               rescan_work->devices_before =3D devices_before;
> +               rescan_work->route =3D tb_route(sw);
> +               rescan_work->port =3D up->port;
> +
> +               INIT_DELAYED_WORK(&rescan_work->work, tb_pci_rescan_work_=
fn);
> +               queue_delayed_work(tb->wq, &rescan_work->work,
> +                                  msecs_to_jiffies(TB_PCIEHP_ENUMERATION=
_DELAY));
> +       }
> +
>         return 0;
>  }
>
> --
> 2.51.0
>


--=20
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)

