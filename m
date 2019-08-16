Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 948ED9082D
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2019 21:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727562AbfHPTYY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Aug 2019 15:24:24 -0400
Received: from mail-wm1-f48.google.com ([209.85.128.48]:55055 "EHLO
        mail-wm1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727545AbfHPTYY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Aug 2019 15:24:24 -0400
Received: by mail-wm1-f48.google.com with SMTP id p74so4863645wme.4
        for <linux-usb@vger.kernel.org>; Fri, 16 Aug 2019 12:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=1HcFplCbmvXE7o6cpu6Yo/Ng/VjcIn4utmTiOs6kn40=;
        b=vS0ehx1DGwtF3pOacafJ95jzXx1e3Deq+902dzWVz3hvxCeEWI7LKjncnoTYVNbBns
         N/6d+kxHFCcg9jWPJxYdRD6f27WXdqO1EABfg6S8mRzXBKy/UkoNP3Q6bROzKIPMc1JN
         12qWi/YBSkhZBs4dyIOaEouUqVCyr7tQtxGOnB8qhm4OgHAvJeFKQgKS0MP9yL6tbHdh
         6OTRJrLHagmenJHQL/CyJ56yHDgHD7/RNCypHjuC4ydl4UDriMN8AyAMJ4mbq99hgZ+G
         P8zvI4VRDkNe3erLmnyAQ73lWuU8iYl9XQ80gGBeU0yQNXJtw6cYmkJc9y+W2Mq2ScA7
         tQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=1HcFplCbmvXE7o6cpu6Yo/Ng/VjcIn4utmTiOs6kn40=;
        b=oFFGeCZqrEm1CnQpdOjYOS56jibKhK4PkPKjWn4iTCcNWUkc2VySEjI99fFEa+yp5s
         gEe1AwRsITC0Kv2oYa+jUaFdzP8Qva0l3OOv18ZbDHinUnHGZJiWA+J7/XmG5YFDTmFR
         4vHN6qQX0NdoUwQ5TcwtqeXZyla5Rdfaigc/Mdr1UUgV/eT63M3MeRKZuo6LR3uMUPT8
         AvzrgHbdBKXjXCFENpT9jas1M9VoRGrejUz1EM5JiUhaQwqzoNx2ffGTlGu06oO3Lumm
         O3SqLnPfQzjqgn7iPJ59s6S8P3ayvY/EYeLUgIMBP05g9cxwxIMlIQt2VTpKdiN6GdPf
         p78g==
X-Gm-Message-State: APjAAAVDeA7jiC9MnhSpSjoKH2gi0M2/+JmQAEVxog6H3AYDCIMdedsS
        c9az/k7CeQEjfqZ1IaXWEajsJ60OAGc=
X-Google-Smtp-Source: APXvYqw/rJTqP4jCldD9V1CsOPylZToCSUvNhzwt/D+VL2vmj0FegwQ/KEvs/Q8Vc1Vd6nrle/K62A==
X-Received: by 2002:a7b:c95a:: with SMTP id i26mr9082098wml.175.1565983461882;
        Fri, 16 Aug 2019 12:24:21 -0700 (PDT)
Received: from euler ([208.48.166.26])
        by smtp.gmail.com with ESMTPSA id m6sm4967379wrq.95.2019.08.16.12.24.20
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2019 12:24:20 -0700 (PDT)
Message-ID: <764b04f6b4d3ce734a9b00048ea79999b4a099d4.camel@gmail.com>
Subject: kernel 5.2.7 support for usb Apple Superdrive is broken
From:   David Walthour <dwalthour@gmail.com>
To:     linux-usb@vger.kernel.org
Date:   Fri, 16 Aug 2019 14:24:18 -0500
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I am new to this mailing list, so please go easy on me if I'm breaking
etiquete.

Upgraded my Fedora 30 install from linux kernel 5.2.6 to 5.2.7 (and
5.2.8) and my apple usb superdrive stopped working. Booting up in 5.2.6
and it works again as expected, so it appears to be due to changes in
5.2.7.  

I am unsure of where to look to see if this is already reported and
being fixed. If not, I am willing to help out in fixing it as it seems
to be a reasonably small set of diffs between 5.2.6 and 5.2.7 that
could account for it, but I am new to patching linux, so I am unsure of
where to get started. Any help would be appreciated.

Thanks!

