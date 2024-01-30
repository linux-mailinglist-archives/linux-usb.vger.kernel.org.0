Return-Path: <linux-usb+bounces-5623-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8948422C8
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 12:21:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 423991F243A0
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 11:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B9D66B20;
	Tue, 30 Jan 2024 11:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rq5eO6l5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AF56A013
	for <linux-usb@vger.kernel.org>; Tue, 30 Jan 2024 11:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706613375; cv=none; b=S/SkHIlAzd3LzFFQB5J1En7WNQylKxe3oxAfMVj0yFjkJeleZhNcUwR+IUlVvEcL6sJcnvxfzyevRFwK3mRxGPCAlo9g0/AbxYdPY3MLphFGnPob3fAvzcLaV1KXcX++kqN81toJ0H1cy9ru7pX+nH6MZ6UutSfUJsFFsN70YuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706613375; c=relaxed/simple;
	bh=my2DZVZeYS3f4Ii6sR3me5xOAkO6qzbgpoetr2XTh34=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hVnXYOykmyhidkun/0fO4E3NGRcyZKPJm4277pxjtFgHMiunnDxFdvUrVWOq6KCnkij/BJCHvB3kYx2d/rbqowRmMwVAbYHa5u86Z+sbmHZpL2CxEstdlO94j0nmMlv5Me/KGplFm/B602bs+rM++il4yQBmswB67t54Atva30k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rq5eO6l5; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5111e5e4e2bso478296e87.3
        for <linux-usb@vger.kernel.org>; Tue, 30 Jan 2024 03:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706613371; x=1707218171; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tfsTsYPfpJ+yYo/bWM1v4X4OBiwVPAlvkOuXpARYgGA=;
        b=Rq5eO6l5HDrrbKSw46NfZ1jlV5yhchRl/gXd4JK3WWBWSj282qkDnpZngQRmGMnYIQ
         B7+UnvaNtN3n94XkcZzanObzW3IpDnkVsW8SobqCti+YeyzVoQm08ExbicO9hzxxA/zs
         iK37FwBlYOKHmuN+M6kHYkLcylAf8y9rnYAkwGTJEjelAJRk1akysECwrXfFUomwwrb8
         F9Fp50M6VM+8vE7ZrmhdsFGtWGZVaJF5KnkTztsjpgd1b5mmMIKNjSuagTAzjQJPYUyL
         PVKsfZXzFMlJgxajRYIgJzJB/YpzePld7uteLaeygWFIFST8OWaVtPCy/Y3UAdwzMTwp
         DW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706613371; x=1707218171;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tfsTsYPfpJ+yYo/bWM1v4X4OBiwVPAlvkOuXpARYgGA=;
        b=uCRiNeRLQ6xfdO4ZWnftj4nS+DhKfbtVT9D6ltxCQv8xl+9M1FGm9VKlZL7zVZD+FG
         b0pGYZbcyJnFynAi4z261lmuZADA6P32EF4v1KLv2nzHaE4Vfevej2e2i3WW0QH0/2Py
         GOII/uDgg69bqu/uSt3GElV2wc/TktQmaoDqD8CQSDu8u32OPrwiAyWk2oBCDX0DhS40
         bIKmgANoJX/QC9MeEl3wcbSNM7YlZ2kwEE4NI2cTCG7AiOE/mP6HwXGe1aZwoUk/6wo/
         lli5fYoXVadBUgNhtYmG7vL9Wc3QPfXWACsEeMhK+5KmISEyGHDaCeILjrMNGDC4DiDd
         atXQ==
X-Gm-Message-State: AOJu0YzsvHw9UyYTCz6dGvfxBYbgNXSvrq+A6zkZ+hZ9RM1odfpMYgpO
	qN3Qr5APkTauj0kiYIwNWhLf2DK0A48HlUKp+LLfn+FvvIQdzqW5np/Bakfla4Q=
X-Google-Smtp-Source: AGHT+IGBOiM2Nd/Q+uDxq9oaLCi14I+FX05nfCqErJJvRSRT4m5vNFQMp4VHCX7mgv7+YLJGHwAeAw==
X-Received: by 2002:a2e:9b52:0:b0:2cf:4994:616b with SMTP id o18-20020a2e9b52000000b002cf4994616bmr5454508ljj.15.1706613370861;
        Tue, 30 Jan 2024 03:16:10 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id fa8-20020a056000258800b0033afb7c68a7sm1396545wrb.55.2024.01.30.03.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 03:16:10 -0800 (PST)
Date: Tue, 30 Jan 2024 14:16:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: rdbabiera@google.com
Cc: linux-usb@vger.kernel.org
Subject: [bug report] usb: typec: tcpm: add discover identity support for SOP'
Message-ID: <a432603b-b801-4001-b309-247dded707d3@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello RD Babiera,

The patch fb7ff25ae433: "usb: typec: tcpm: add discover identity
support for SOP'" from Jan 8, 2024 (linux-next), leads to the
following Smatch static checker warning:

	drivers/usb/typec/tcpm/tcpm.c:1931 tcpm_pd_svdm()
	error: uninitialized symbol 'svdm_version'.

drivers/usb/typec/tcpm/tcpm.c
    1859 static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
    1860                         const u32 *p, int cnt, u32 *response,
    1861                         enum adev_actions *adev_action,
    1862                         enum tcpm_transmit_type rx_sop_type,
    1863                         enum tcpm_transmit_type *response_tx_sop_type)
    1864 {
    1865         struct typec_port *typec = port->typec_port;
    1866         struct typec_altmode *pdev, *pdev_prime;
    1867         struct pd_mode_data *modep, *modep_prime;
    1868         int svdm_version;
    1869         int rlen = 0;
    1870         int cmd_type;
    1871         int cmd;
    1872         int i;
    1873         int ret;
    1874 
    1875         cmd_type = PD_VDO_CMDT(p[0]);
    1876         cmd = PD_VDO_CMD(p[0]);
    1877 
    1878         tcpm_log(port, "Rx VDM cmd 0x%x type %d cmd %d len %d",
    1879                  p[0], cmd_type, cmd, cnt);
    1880 
    1881         modep = &port->mode_data;
    1882 
    1883         pdev = typec_match_altmode(port->partner_altmode, ALTMODE_DISCOVERY_MAX,
    1884                                    PD_VDO_VID(p[0]), PD_VDO_OPOS(p[0]));
    1885 
    1886         switch (rx_sop_type) {
    1887         case TCPC_TX_SOP_PRIME:
    1888                 modep_prime = &port->mode_data_prime;
    1889                 pdev_prime = typec_match_altmode(port->plug_prime_altmode,
    1890                                                  ALTMODE_DISCOVERY_MAX,
    1891                                                  PD_VDO_VID(p[0]),
    1892                                                  PD_VDO_OPOS(p[0]));
    1893                 if (!IS_ERR_OR_NULL(port->cable)) {
    1894                         svdm_version = typec_get_cable_svdm_version(typec);
    1895                         if (PD_VDO_SVDM_VER(p[0]) < svdm_version)
    1896                                 typec_cable_set_svdm_version(port->cable, svdm_version);
    1897                 }

svdm_version is uninitialized if port->cable isn't a valid pointer.

    1898                 break;
    1899         case TCPC_TX_SOP:
    1900                 modep = &port->mode_data;
    1901                 pdev = typec_match_altmode(port->partner_altmode,
    1902                                            ALTMODE_DISCOVERY_MAX,
    1903                                            PD_VDO_VID(p[0]),
    1904                                            PD_VDO_OPOS(p[0]));
    1905                 svdm_version = typec_get_negotiated_svdm_version(typec);
    1906                 if (svdm_version < 0)
    1907                         return 0;
    1908                 break;
    1909         default:
    1910                 modep = &port->mode_data;
    1911                 pdev = typec_match_altmode(port->partner_altmode,
    1912                                            ALTMODE_DISCOVERY_MAX,
    1913                                            PD_VDO_VID(p[0]),
    1914                                            PD_VDO_OPOS(p[0]));
    1915                 svdm_version = typec_get_negotiated_svdm_version(typec);
    1916                 if (svdm_version < 0)
    1917                         return 0;
    1918                 break;
    1919         }
    1920 
    1921         switch (cmd_type) {
    1922         case CMDT_INIT:
    1923                 switch (cmd) {
    1924                 case CMD_DISCOVER_IDENT:
    1925                         if (PD_VDO_VID(p[0]) != USB_SID_PD)
    1926                                 break;
    1927 
    1928                         if (IS_ERR_OR_NULL(port->partner))
    1929                                 break;
    1930 
--> 1931                         if (PD_VDO_SVDM_VER(p[0]) < svdm_version) {
                                                             ^^^^^^^^^^^^

    1932                                 typec_partner_set_svdm_version(port->partner,
    1933                                                                PD_VDO_SVDM_VER(p[0]));
    1934                                 svdm_version = PD_VDO_SVDM_VER(p[0]);
    1935                         }

regards,
dan carpenter

