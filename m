Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5528117E0E2
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2020 14:14:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbgCINOF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Mar 2020 09:14:05 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:50344 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbgCINOE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Mar 2020 09:14:04 -0400
Received: by mail-pj1-f67.google.com with SMTP id u10so2737928pjy.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2020 06:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=rDIhPTyW8q3YTfa4iU522+aqdK2EBIQqrSM9utIxD4Y=;
        b=jMM8wjhhoKvM5r8RmFrP8Uyc6dgDm6NfOOiCMEdtbo7IPcXZ2xlVmVxItXmErV81Ke
         G+E2C0u3eoLmWnpOa+m8O7K0sNy/lMaQDNG7eJoJSjA3VBt8ioG64l0nSIp7umBfzWct
         cBZkTjenZ69JT80Z0FN5U0dmEiC/ELMvK5fnFAsgvVqVg3sqiQQsToKxmzLoUsvdEquK
         L9GS+YmFKvogcCXbBzkRZjG3Q1YnuobgK3/+DATb0g/FhJASNkiPkfo2ogIYhjt0eh0+
         60+Rg4li8MKZGFXlSZtwVJIJ+JLaGn0C0bGIlsduLmIDr4Qte2H8v/tNWLH++ItMYmep
         d1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=rDIhPTyW8q3YTfa4iU522+aqdK2EBIQqrSM9utIxD4Y=;
        b=WfRWiubRTh/eCEZyDl+d698HgZLQQ0waZhH2EXnoByu6f/oG1Re8fJ5RzC5ohWga+o
         4//67F/Mln96BnfoaOlvcDqXa72EIUronVdYhkMwF3L0vo1c8CB0g/uolAUQNaZ91DPZ
         BomL5ASZ6+o4fnhA2F8Z2eI8KdcvySqlMSWjli9725hpOO4WYUtlLdoFoIYgQ5wrOZz6
         HHR/sbZKVme4XufeAV8k7vcrFOE7/gj64OibQj8j2IcTaMmncnCgvzKAjDefn1pnSkwe
         tg1cuvrwqlfjFGj7+CcUZ8MOXndRCo9gRB6eCZyPhhdbFD06XjGif/MHRe1UuhnF4rHA
         8JmQ==
X-Gm-Message-State: ANhLgQ3t+95bvfcn3YoZJMVcqQWhWJJkp9l578rGM5NJSoIiR//qFMjw
        popRIgC0YwuXj9ZHNgsBGLwrtTRWcQs=
X-Google-Smtp-Source: ADFU+vtSuw183nDm4MIAyb621YKnWqAEGgJrLBoeyzIcvj23NCvK3ZHULA+xxncSq5UvMMgPsEUrLw==
X-Received: by 2002:a17:90b:30cb:: with SMTP id hi11mr19336775pjb.112.1583759643217;
        Mon, 09 Mar 2020 06:14:03 -0700 (PDT)
Received: from payal-desktop ([157.33.162.233])
        by smtp.gmail.com with ESMTPSA id f8sm44651812pfn.2.2020.03.09.06.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 06:14:02 -0700 (PDT)
From:   Payal Kshirsagar <payalskshirsagar1234@gmail.com>
To:     manishc@marvell.com, GR-Linux-NIC-Dev@marvell.com,
        gregkh@linuxfoundation.org, outreachy-kernel@googlegroups.com
Cc:     Payal Kshirsagar <payalskshirsagar1234@gmail.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 0/3] [Outreachy kernel] staging: qlge: qlge.h: cleanup suggested by checkpatch
Date:   Mon,  9 Mar 2020 18:43:53 +0530
Message-Id: <cover.1583759118.git.payalskshirsagar1234@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Cleanup suggested by checkpatch for the file drivers/staging/qlge/qlge.h.

Payal Kshirsagar (3):
  [Outreachy kernel] staging: qlge: remove spaces before tabs and align
    code
  [Outreachy kernel] staging: qlge: qlge.h: add spaces around operators
  [Outreachy kernel] staging: qlge: qlge.h: remove excess newlines

 drivers/staging/qlge/qlge.h | 69 ++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 36 deletions(-)

-- 
2.17.1

