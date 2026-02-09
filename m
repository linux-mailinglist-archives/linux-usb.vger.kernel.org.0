Return-Path: <linux-usb+bounces-33197-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LAlEk/siWlpEQAAu9opvQ
	(envelope-from <linux-usb+bounces-33197-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 15:16:47 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AE6110226
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 15:16:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4872C3022923
	for <lists+linux-usb@lfdr.de>; Mon,  9 Feb 2026 14:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224962750E6;
	Mon,  9 Feb 2026 14:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cf47pej+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421D413D638
	for <linux-usb@vger.kernel.org>; Mon,  9 Feb 2026 14:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770646591; cv=pass; b=F/UdfoDyvSeL/hskTW8d+OYavmHGNjCgz/3EGAzJXd9L9dWBGYXw30jGB95xt+6Em8HY4kGhEbqM4Nx6Cj7TGpWYcgFJO4Y3Dfx+z2uut+c7gB3QV6vtzpmzXAyGOQBYQXdAFJu3bgflYxVU2WQZelIR82/PLQfru1hQiRxvBdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770646591; c=relaxed/simple;
	bh=HNisyMlZL+OvExQstV+QoI3I+cNIwlAG9yFLwe3U6hk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ikkElZQCXi4RNO4rdyjh7F+F7JM/X84h6JY0td3xKc9Es2eoAbuUVYXxED42ViiXx1b4BbegjlbkQfOpQmbLcM4I4tm3b/Y7Usl3OoR/WBDpdKkDtXzrp3WuZlN19/e3XPeadO6hGYdR4yAPLk4U4DhdT+wG2mRY+tv9HMNwKuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cf47pej+; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-382f9211cbfso26079341fa.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Feb 2026 06:16:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770646589; cv=none;
        d=google.com; s=arc-20240605;
        b=NR9HKHalh7ZJeaSx3gXBnciEiF9K3S/lASOv+YwMni4OtS1F5PZnE1T6TWpDKjoyW9
         HPyYbjSv/NhSGHfpaT2P1Djl9Ss5sfp95GaSLuNlzWZ5TVpMueMejtBsjcxd3SAzKjg0
         h+5Tg0+LHloIll1bMmkFiXXJ6rB30L0yyyYDffFUJphtImRM2HAJBJ56YaRXWBPgF2eb
         pLPKiJCKTs7P7eqlN3eilMAZ35l/TAcVMgc7ho7skDta4Sn/W4Y6raZypcBwyWgL3wtp
         UE2VcnfA4A7LwhpyaBo8Nev8es/0OhK7NzBOSgmwvvmBSMOtjuXHPs+F/fLgQhE5ol8c
         +m9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Htw7pAtQmxc3A1rsRk/hOXO440gMEQtYGKnJ5exKa8E=;
        fh=rJYdkLIy7vQETOPE5wEwShLowTre3A2i3j1T0BxPLBs=;
        b=NdXdX04/NsldgZiXgaJzxaYVSfFnC2j8AODMAMgbp/rOtanrxjrO0kvFhmkO2ZqHP0
         K1tOl7wU9lQSjfAXchDt9wtCuZqsmxT0Z43APqgoun32XDb1wv/SxFAwU8i1UBCSrgtP
         s3F1aHJbpgv4NC4ej0h5kS0nBNGN9vdX+5orlwDmqz+zkhCoXxUab7+vZILfsN8Cb056
         asjcam4ygSlb4ox7si4ExOxKNK2T+E8cDcFQsGUjnV3C6udiFYjC2IOduaX+paOfCCfK
         037crXFfpcZetTY9joOrnHsvXdKeU/zMaIobXf/OK6CK6C5TtZpVMeK4i+ONTNjZQtV/
         0+dA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770646589; x=1771251389; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Htw7pAtQmxc3A1rsRk/hOXO440gMEQtYGKnJ5exKa8E=;
        b=cf47pej+2FxHtX4HO7efIwQVj/L0VDVteoB0KbeGQv5hq193iA9l+c4ReKdSP0PvKB
         JiyTdySevGwYOtTHSBGhFs/EGwO5gKlDOm2PGQZRcxyzn1bryRahLEpG0jbUu6qlLYTC
         gY5ebBWMD3vRqbkQ2NssbTEHzAdnMr3jU3pKYyeaRKzljZpDzb4gfQhqUKqhQC/yw1rm
         /acjSsXTenhryAmN1V1XZNtn3xztQsubZWyOUKSWFqWuIptkocl7OJqxemqYBLQ2IPWO
         pEHA71sL/d5Iq1QUUeVJaYFSxu+ELVUdMXV75unvE4O4kGtSpGehaOECMqr6cazrBH2h
         Pb6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770646589; x=1771251389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Htw7pAtQmxc3A1rsRk/hOXO440gMEQtYGKnJ5exKa8E=;
        b=XFFGaXsY1wTFD9voMILX+UFvR7K6J6JFnhzCk3fa4cdsqKWt7A58cVgX6VfRDb2rGV
         XfJ25ZujwjeRr+/R4D3uwjN9g3E2rk2XWOYq6Tv9hjPCmVPT3TFNul2SLqtUh+0vowNK
         fzzecpsaP82XLftpU7ubnsyde4ytSBC8msikcxjdnErAM1z9cAmRrVrgToInx6eXz2IB
         F2hOzig1ZISvdwtaeYCs6wqm6NB7zM40SJE/3AcT/V2vmCnH+bycA4DpWGyyJGW7ctkc
         cO+6Qcuf0/O8OQDYsk3ZLcgwIeRZXwQSXh02wNERuIn2bEUmzGKvSWywBHTpPF37R3/2
         DdAw==
X-Gm-Message-State: AOJu0Yz6pXJ3NH45hrtokcME49CnDMgIyp+5FYf8wYDZZujZtgRtqmLP
	9v8hUEHqFvgBMYKPGS8Ji68x4tdRdZVBjUP0WwJl2TkNA0yoHY32yTpES7tNNOUW9zGoaKiyOo1
	tU+LcqzIuVWFdZzoF3VlKhbZDp9Jta8w=
X-Gm-Gg: AZuq6aL3BzmJZSHsuBA8VgxXLqFyUhorJEO3zrKeuKWUGBotBkR/yobMC1/Mjcv53tR
	XNbA197+ZFB3hDfopPgT729nP1xtR3xP8+RjtW+VQBCbB00cMuHTO93MGq0mho0k7lAE32YxoSb
	Eu8Q117DjLbiXL7U6TV1XnhLVGvQqv2AeLgTYiyfzfPjKghsHTIXERzBrFa00Pux7P5qFQ/HK3d
	y5d2MNT7CJWoMLmps+jV8j3mvyPlqpNp3DMYmbNcHCNNrzO3MQEt75oKwZ4Jcv+sGVHJ6+Z70lp
	KJ8DXarr1uBo0myufFeBmHd5Eck=
X-Received: by 2002:a05:651c:b22:b0:386:9325:228b with SMTP id
 38308e7fff4ca-386b4e7b89bmr34634231fa.5.1770646588988; Mon, 09 Feb 2026
 06:16:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOMZO5DuiHWpu9px2-FDWwBnq-W-jEQj1GMSUpTKvncw4OBF-g@mail.gmail.com>
In-Reply-To: <CAOMZO5DuiHWpu9px2-FDWwBnq-W-jEQj1GMSUpTKvncw4OBF-g@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 9 Feb 2026 11:16:17 -0300
X-Gm-Features: AZwV_QgbZBuo8gXBLe5yJmaq81DF4Fv_8wokubt2rlrsPedP9vKyb4opIUHWhAU
Message-ID: <CAOMZO5CVcLRBhXByZRT=dNGFWZuQm7r-ALXnWUgC1wu8tXxHfg@mail.gmail.com>
Subject: Re: i.MX6 chipidea: USB port does not power off
To: Peter Chen <peter.chen@kernel.org>, Xu Yang <xu.yang_2@nxp.com>, 
	Frank Li <frank.li@nxp.com>
Cc: USB list <linux-usb@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33197-lists,linux-usb=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[festevam@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E8AE6110226
X-Rspamd-Action: no action

On Mon, Feb 9, 2026 at 12:09=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> Hi,
>
> On a i.MX6SX board running 6.19-rc8, a USB pen drive is connected to
> the USB host port.
>
> I need to be able to power off the USB host port. This is what I've tried=
:
>
> # echo 1 > /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
> [   55.396980] usb 1-1: USB disconnect, device number 3
>
> After this command, VBUS is still at 5V.

I noticed that the regulator handling inside ehci_ci_portpower() is not cor=
rect:

priv->reg_vbus is NULL. The regulator is at ci->platdata->reg_vbus.

I did the following changes:

diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
index ced6076a8248..d77f3a9e46e9 100644
--- a/drivers/usb/chipidea/host.c
+++ b/drivers/usb/chipidea/host.c
@@ -37,31 +37,8 @@ struct ci_hdrc_dma_aligned_buffer {

 static int ehci_ci_portpower(struct usb_hcd *hcd, int portnum, bool enable=
)
 {
-       struct ehci_hcd *ehci =3D hcd_to_ehci(hcd);
-       struct ehci_ci_priv *priv =3D (struct ehci_ci_priv *)ehci->priv;
        struct device *dev =3D hcd->self.controller;
        struct ci_hdrc *ci =3D dev_get_drvdata(dev);
-       int ret =3D 0;
-       int port =3D HCS_N_PORTS(ehci->hcs_params);
-
-       if (priv->reg_vbus && enable !=3D priv->enabled) {
-               if (port > 1) {
-                       dev_warn(dev,
-                               "Not support multi-port regulator control\n=
");
-                       return 0;
-               }
-               if (enable)
-                       ret =3D regulator_enable(priv->reg_vbus);
-               else
-                       ret =3D regulator_disable(priv->reg_vbus);
-               if (ret) {
-                       dev_err(dev,
-                               "Failed to %s vbus regulator, ret=3D%d\n",
-                               str_enable_disable(enable), ret);
-                       return ret;
-               }
-               priv->enabled =3D enable;
-       }

        if (ci->platdata->flags & CI_HDRC_PHY_VBUS_CONTROL) {
                if (enable)
@@ -158,6 +135,7 @@ static int host_start(struct ci_hdrc *ci)

        if (ci->platdata->reg_vbus && !ci_otg_is_fsm_mode(ci)) {
                if (ci->platdata->flags & CI_HDRC_TURN_VBUS_EARLY_ON) {
+                       pr_err("***** Enabling regulator in host_start()\n"=
);
                        ret =3D regulator_enable(ci->platdata->reg_vbus);
                        if (ret) {
                                dev_err(ci->dev,
@@ -168,6 +146,8 @@ static int host_start(struct ci_hdrc *ci)
                } else {
                        priv->reg_vbus =3D ci->platdata->reg_vbus;
                }
+
+               ci->platdata->enabled =3D true;
        }

        if (ci->platdata->pins_host)
@@ -276,6 +256,24 @@ static int ci_ehci_hub_control(
                        goto done;
        }

+       if (typeReq =3D=3D ClearPortFeature && wValue =3D=3D USB_PORT_FEAT_=
POWER) {
+               if (ci->platdata->enabled) {
+                       pr_err("******* Disabling regulator\n");
+                       regulator_disable(ci->platdata->reg_vbus);
+                       ci->platdata->enabled =3D false;
+               }
+       }
+
+       if (typeReq =3D=3D SetPortFeature && wValue =3D=3D USB_PORT_FEAT_PO=
WER) {
+               if (!ci->platdata->enabled) {
+                       pr_err("******* Enabling regulator\n");
+                       retval =3D regulator_enable(ci->platdata->reg_vbus)=
;
+                       if (retval < 0)
+                               pr_err("******* Failed to enable regulator\=
n");
+                       ci->platdata->enabled =3D true;
+               }
+       }
+
        if (typeReq =3D=3D SetPortFeature && wValue =3D=3D USB_PORT_FEAT_SU=
SPEND) {
                if (!wIndex || wIndex > ports) {
                        retval =3D -EPIPE;
diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
index c6451191d2de..f4f4524db22f 100644
--- a/include/linux/usb/chipidea.h
+++ b/include/linux/usb/chipidea.h
@@ -76,6 +76,7 @@ struct ci_hdrc_platform_data {
 #define CI_HDRC_CONTROLLER_PULLUP_EVENT                5
        int     (*notify_event) (struct ci_hdrc *ci, unsigned event);
        struct regulator        *reg_vbus;
+       bool                    enabled;
        struct usb_otg_caps     ci_otg_caps;
        bool                    tpl_support;
        /* interrupt threshold setting */

And now the VBUS regulator is disabled:

# uhubctl -p 1 -a off
Current status for hub 1 [1d6b:0002 Linux 6.19.0-rc8-00013[
106.733803] usb 1-1: USB disconnect, device number 2
-g9bbe71ed0c6a-dirty ehci_hcd EHCI Host Controller ci_hdrc.1, USB
2.00, 1 ports, ppps]
  Port 1: 0503 power highspeed enable connect [0457:0151 USBest
Technology USB Mass Storage Device 000000000003FF]
[  106.858289] ******* Disabling regulator
Sent power off request
New status for hub 1 [1d6b:0002 Linux
6.19.0-rc8-00013-g9bbe71ed0c6a-dirty ehci_hcd EHCI Host Controller
ci_hdrc.1, USB 2.00, 1 ports, ppps]
  Port 1: 0000 off

The problem now is that powering up the port fails inside mxs_phy:

# uhubctl -p 1 -a on
Current status for hub 1 [1d6b:0002 Linux
6.19.0-rc8-00013-g9bbe71ed0c6a-dirty ehci_hcd EHCI Host Controller
ci_hdrc.1, USB 2.00, 1 ports, ppps]
  Port 1: 0000 off
[  117.114697] ******* Enabling regulator
Sent power on request
New status for hub 1 [1[  117.122923] mxs_phy 20c9000.usbphy: vbus is not v=
alid
d6b:0002 Linux 6.19.0-rc8-00013-g9bbe71ed0c6a-dirty ehci_hcd EHCI Host
Controller ci_hdrc.1, USB 2.00, 1 ports, ppps]
  Port 1: 0100 power
# [  118.333697] usb usb1-port1: Cannot enable. Maybe the USB cable is bad?
[  119.243790] usb usb1-port1: Cannot enable. Maybe the USB cable is bad?
[  119.250825] usb usb1-port1: attempt power cycle
[  119.256584] ******* Disabling regulator
[  119.303803] ******* Enabling regulator
[  120.523775] usb usb1-port1: Cannot enable. Maybe the USB cable is bad?
[  121.433762] usb usb1-port1: Cannot enable. Maybe the USB cable is bad?
[  121.440793] usb usb1-port1: unable to enumerate USB device

Any ideas?

Thanks

