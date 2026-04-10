Return-Path: <linux-usb+bounces-36131-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNfmGp/P2GngiQgAu9opvQ
	(envelope-from <linux-usb+bounces-36131-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 12:23:27 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6BE3D59D4
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 12:23:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85F4F309B02B
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 10:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6622335DA6F;
	Fri, 10 Apr 2026 10:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vmzo3Xqo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C818028727D
	for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 10:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775816109; cv=none; b=Gz9qHb0p/bosJpuqrtSuvKBjl6fa+Z5NgndIqq+TQvr/5cLcoHCLYYXiSDNjmosRpYYLw71cFt5IrzAaHe3q6ye3UuA88NxqWVbuEt163NS4yWj+ljRTY3YthViDwnXKmOSODDKBMqYfmNxYDHoWQ084TOk2jDoDPWQp+W9P3zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775816109; c=relaxed/simple;
	bh=RP/nVvEHpN1J0Fle4aL3sHOKU4vU8jpfNdWtCascGTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AzVT+UNM28WeB/g6BS9IhVYq5i1MT8m7Nl2bgsfEnu9VqWA4kSru1lt9mxaLvJDfv+mtv95QfUYb4GJ32jagw+7o7uGZKCd/YpvlF45g0YJyLdSsI2HO3eC3HSgEmsh5OGE5fg1zfemhjTulmHWZNP+dJvcXcoTPsAxOrcU3MEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vmzo3Xqo; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso27475395e9.3
        for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 03:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775816106; x=1776420906; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vgfmB+epjFBhO13jKxEiUes23CJsq2IfBIM/S1tI6WY=;
        b=Vmzo3Xqoonyj4ReM9r4+2U65mN/SMk2Dc0D5ICWHTJmmAmBH5jZSr8s8c7PCII2NlH
         K9+2LHFD9KkEjq4u6KjxqF6PROfJKPAbyDlhQ1kO5r08h4anbGJn3KoaoOWM5Cu9fWgK
         svNcdPvKjlpNlwS6bIh1di5zJzMX/Z8WcYyk0ijnmlJ8rOLKsCJR/sTnEjUG6E+qC7e7
         TYDfjBP53hPbjsZacz1RmAzgqQLTSuzOk/LRufG9MBs5L/p2vPbeFbDDc2d8Wi0IAfsV
         NJlqdOvd1Fno6wpsKRU7+GL8Ki7TBDh0poxKbvQZL9qYKF044yqd53C4ykZY9VRk4V15
         rr4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775816106; x=1776420906;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vgfmB+epjFBhO13jKxEiUes23CJsq2IfBIM/S1tI6WY=;
        b=GRXjUYB8r5ZR9Eca9+hMSf64nJdxLYrrB++H5BLD6uVw+moKavYFP4Gqg7dr6WGdpo
         i2bOnFr7PWWRI0TSyRQNQqYKshjMRWUjdniBcsuzxnfVze1+fbulyyjM21IPbyQf19CI
         3HQdcV8xoMf/xIF2RvwCFVYq82eCc0kTAIGGAexkxV4jt0vdF+vBkbX2aTS9bouQzcl7
         49Z7wcDmgCZLoIwpc599Ggovy7wrmtn6iHzifBUH3WqQOBpILa2pJRAC8kJyXA3eOepv
         ptQEKYQBKG7x8/KtDUhiffVbCWe5mprFjXPr39B6GnvC/MWtwKGr6LngRkh/q8M+zGce
         eg1g==
X-Gm-Message-State: AOJu0Yysc8zjD0S2oppnZ4wBaGFkPdHfR60y80yvNXouPqo4kduIRoqJ
	JzbPXeSkILQhTtLT7/OpsQ1RPivbyJZpJtEnXvDrRBYk7xuYKNqBCS3W
X-Gm-Gg: AeBDietGAq4rqjBiSS7QuYcNl9VqlTlmtGW/n3WPtVnZ5H0DJkN4R/Wox7tmjwXjrIK
	qn99t/EvlJCyAQk0RHqoqbRaqjj8gNw0mhUe4nQQH1W2yo4534uG4DrFUued/dMRx557GmrdK5D
	ZH3FBawBXlF7/fsuTE1v+MnuswxxHaBQiEij7NLhFB+uW/vZgbwN1qIwMrDQnFxie52ELcTwnKv
	XSrpYcwZJvMVOp4CVbbVpm28EY4SQRrarZ3jw9zPi3dxB5qbaTAvysj5ZWjRCRMceoecYBH3gtG
	c4cagnZwirUH+DwWMy5efRp7Qi9B3nzdTPcm9f9XF/OjJgsxGvmh/y3BauiY8HgUudAWmJ9XP0X
	8LiDehCp6TGIMoo6YfCPoLd0iAhkKBtRqXNN5BblXUhoCGJUpBbngQGyrwk0qsvU9voTh3zyIU+
	c0O+ZNMxTdXk7cpK90vSgLBj2yfqpR+Q==
X-Received: by 2002:a05:600c:608e:b0:488:8185:e672 with SMTP id 5b1f17b1804b1-488d688d2fbmr31422585e9.30.1775816106161;
        Fri, 10 Apr 2026 03:15:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67a46bdsm26449765e9.3.2026.04.10.03.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:15:05 -0700 (PDT)
Date: Fri, 10 Apr 2026 13:15:02 +0300
From: Dan Carpenter <error27@gmail.com>
To: Michael Zimmermann <sigmaepsilon92@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: [bug report] usb: gadget: f_hid: don't call cdev_init while cdev in
 use
Message-ID: <adjNpgyF8W5Aen7Q@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-36131-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0C6BE3D59D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Michael Zimmermann,

Commit 81ebd43cc0d6 ("usb: gadget: f_hid: don't call cdev_init while
cdev in use") from Mar 27, 2026 (linux-next), leads to the following
Smatch static checker warning:

	drivers/usb/gadget/function/f_hid.c:1282 hidg_bind()
	warn: missing error code here? 'cdev_alloc()' failed. 'status' = '0'

drivers/usb/gadget/function/f_hid.c
    1263         if (status)
    1264                 goto fail;
    1265 
    1266         hidg->write_pending = 1;
    1267         hidg->req = NULL;
    1268 
    1269         INIT_WORK(&hidg->work, get_report_workqueue_handler);
    1270         hidg->workqueue = alloc_workqueue("report_work",
    1271                                           WQ_FREEZABLE | WQ_MEM_RECLAIM | WQ_PERCPU,
    1272                                           1);
    1273 
    1274         if (!hidg->workqueue) {
    1275                 status = -ENOMEM;
    1276                 goto fail_free_descs;
    1277         }
    1278 
    1279         /* create char device */
    1280         hidg->cdev = cdev_alloc();
    1281         if (!hidg->cdev)
--> 1282                 goto fail_free_all;

status = -ENOMEM;

    1283         hidg->cdev->ops = &f_hidg_fops;
    1284 
    1285         status = cdev_device_add(hidg->cdev, &hidg->dev);
    1286         if (status)
    1287                 goto fail_free_all;
    1288 
    1289         return 0;
    1290 fail_free_all:
    1291         destroy_workqueue(hidg->workqueue);
    1292 fail_free_descs:
    1293         usb_free_all_descriptors(f);
    1294 fail:
    1295         ERROR(f->config->cdev, "hidg_bind FAILED\n");
    1296         if (hidg->req != NULL)
    1297                 free_ep_req(hidg->in_ep, hidg->req);
    1298 
    1299         usb_ep_free_request(c->cdev->gadget->ep0, hidg->get_req);
    1300         hidg->get_req = NULL;
    1301 
    1302         return status;
    1303 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter

