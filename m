Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56D0DD3E20
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 13:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727581AbfJKLRh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 07:17:37 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44458 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727226AbfJKLRh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Oct 2019 07:17:37 -0400
Received: by mail-pf1-f194.google.com with SMTP id q21so5886642pfn.11;
        Fri, 11 Oct 2019 04:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=VlmC3FzMBaeFdi8vKdtcQ+jsZk6Q6WwIVRbhfWm5BOY=;
        b=hmEs5ubVyP+9yFN5vhfrZRNiRHGIm/4+9CF0qg7KeaatHP681U9J2YkTTARsVVGmLH
         /LgKw8pGN1EhJggSGOPRQD20+b7RxlPK8kqokgmODoNJ+fk3KB81GItuVE8Z1jHNaVPd
         IjvYk0LsvlUx7KuNlXd+2AcFc+6QW9379pLGyYpWobN94jjnal3+vxAnKiPnfDfe5icw
         sO6k22ic/4fex3wCD9Cmax/JozcCKN1IG2jE7cJtMKbok0Xf2PRwsvmt9Xm2l1ZlYq4f
         NDgT8hPAbl/aajx10ahKrGqV3dcOzaCNkUfx4e7xi5NrZJR2ZAwCurCiilDj5n3PNaa7
         zzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=VlmC3FzMBaeFdi8vKdtcQ+jsZk6Q6WwIVRbhfWm5BOY=;
        b=H54xXsAxGjnR4dtzj7L3XxSzO4wk8WnjYRiFFuq4yAZQNly6LikKzAetFZr9WzrgNv
         lPqzvETThFt4eBCAwQf23a4MVkYCxsSa+NP7ql1bP3/u3iw55X8EL/QUb3QhbX42QURT
         +SwZgX3xtlRD40VDR7LwuNis59vLQm4MKFwAVa2BVUiLTtGrqUMwLjJxsrx3Qg6mNFLW
         l0xCd6xrjtxRmK98zFOeKaaHbdMCzeeNA4UrqV2LomUyfEWuGCiqOhx8hdBiheBfgHT7
         NJmaK/KAI6OfUYKob5yx3Y2qNKhkMQ5ZdicqrtMFW0Xrho8NyMSMDlJDuxcYDdRgP2Pr
         ap9w==
X-Gm-Message-State: APjAAAVCDtd0trp9SB9sbFKOGCdbMIqa0pnGBTYBWWaBKTh+DBp5OyrY
        1PHZ7GGx9ixodZmhV6dBC+9Utzel7pw=
X-Google-Smtp-Source: APXvYqycn+7rVl7i80zdVMHgTMFIdpglnAHKiinGYoPqmz3pQhM0QUTxiW30A0mKr8IkfwBAaIX17w==
X-Received: by 2002:a17:90a:730a:: with SMTP id m10mr17082622pjk.78.1570792656558;
        Fri, 11 Oct 2019 04:17:36 -0700 (PDT)
Received: from localhost ([2402:3a80:139e:d60:aa0c:2692:c558:75f5])
        by smtp.gmail.com with ESMTPSA id w14sm22001108pge.56.2019.10.11.04.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 04:17:36 -0700 (PDT)
Date:   Fri, 11 Oct 2019 16:47:32 +0530
From:   Jas K <jaskaransingh7654321@gmail.com>
To:     syzbot+e7d46eb426883fb97efd@syzkaller.appspotmail.com
Cc:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        linux-kernel@vger.kernel.org
Subject: Re: KMSAN: uninit-value in alauda_check_media
Message-ID: <20191011111732.GA25982@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi, just taking a crack at this. Hope you guys don't mind.

#syz test: https://github.com/google/kasan.git 1e76a3e5

diff --git a/drivers/usb/storage/alauda.c b/drivers/usb/storage/alauda.c
index ddab2cd3d2e7..bb309b9ad65b 100644
--- a/drivers/usb/storage/alauda.c
+++ b/drivers/usb/storage/alauda.c
@@ -452,7 +452,7 @@ static int alauda_init_media(struct us_data *us)
 static int alauda_check_media(struct us_data *us)
 {
 	struct alauda_info *info = (struct alauda_info *) us->extra;
-	unsigned char status[2];
+	unsigned char *status = us->iobuf;
 	int rc;
 
 	rc = alauda_get_media_status(us, status);
