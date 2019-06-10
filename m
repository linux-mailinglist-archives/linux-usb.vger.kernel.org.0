Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7683B665
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2019 15:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390335AbfFJNsc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jun 2019 09:48:32 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42074 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390270AbfFJNsc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jun 2019 09:48:32 -0400
Received: by mail-lj1-f196.google.com with SMTP id t28so7983329lje.9
        for <linux-usb@vger.kernel.org>; Mon, 10 Jun 2019 06:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding:user-agent;
        bh=+xHGHLyyVpmqmvF4JOo4/p/f/z3f6+vIzrUpyfNzbn0=;
        b=ShoS4qgJVgNkUbVqjq+PKIZsvfJXWH0Lpg+NnD9/heCOu6hlcEcAN99ayWIit1SDSg
         2B7iRjVgK5Tx1J6brueNcm0AoE5TgxoqVRD07RHnqCncXcK/+hPJ0mMRDr8oX9Th1mTo
         99PhdlXoav2C2uWADOYSQ19LajgNLacz6TJjTJc/XWwWbPv/kTpVrj2vVqMyVsLLa30i
         DifBFQe7HZ1jYu3hl7yS+DRg1A3P7Rew67jrK5877y8sLr+rU+Cvk4hNt7MsT2Oh5l0l
         KJ7bOxYzCjhKCE7eN8N11yHS6qcmYkb1kcgBn4gGiDGU72UcBBu0ZngLNbWSgDUDmWVT
         XqCw==
X-Gm-Message-State: APjAAAVqnSYZkjk+CjwthPrNaN6wZq2dgHIEF38crvuYDMfe85lM3l+3
        wcGUO4M8gxWclYdenUYNTxe2FVU/YeE=
X-Google-Smtp-Source: APXvYqyhKBKuF6zlJvLU/uop8NDgezZIdmn4HM/06BPXtJKUtDqAq2+VKEYa7izSi4r1gHae1/rjJw==
X-Received: by 2002:a2e:9654:: with SMTP id z20mr9909275ljh.52.1560174509621;
        Mon, 10 Jun 2019 06:48:29 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id a4sm1995072lfj.31.2019.06.10.06.48.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 06:48:29 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1haKez-00081f-CN; Mon, 10 Jun 2019 15:48:29 +0200
Date:   Mon, 10 Jun 2019 15:48:29 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial fixes for 5.2-rc5
Message-ID: <20190610134829.GA30830@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.2-rc5

for you to fetch changes up to f3dfd4072c3ee6e287f501a18b5718b185d6a940:

  USB: serial: option: add Telit 0x1260 and 0x1261 compositions (2019-05-21 11:27:24 +0200)

----------------------------------------------------------------
USB-serial fixes for 5.2-rc5

Here are some new device ids for option and pl2303.

All have been in linux-next with no reported issues.

Signed-off-by: Johan Hovold <johan@kernel.org>

----------------------------------------------------------------
Chris Packham (1):
      USB: serial: pl2303: add Allied Telesis VT-Kit3

Daniele Palmas (1):
      USB: serial: option: add Telit 0x1260 and 0x1261 compositions

Jörgen Storvist (1):
      USB: serial: option: add support for Simcom SIM7500/SIM7600 RNDIS mode

 drivers/usb/serial/option.c | 6 ++++++
 drivers/usb/serial/pl2303.c | 1 +
 drivers/usb/serial/pl2303.h | 3 +++
 3 files changed, 10 insertions(+)
