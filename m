Return-Path: <linux-usb+bounces-3139-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3707F379B
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 21:38:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D865F2826EE
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 20:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCABD2207B;
	Tue, 21 Nov 2023 20:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ep9jzMG0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14C581A1
	for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 12:38:51 -0800 (PST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5c9e6c37bc4so42137927b3.2
        for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 12:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700599130; x=1701203930; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o5WQccnjZgaS7AdFyMCtckY+Ntl4rQUUFl7+OMDJuQI=;
        b=ep9jzMG0t2pztHoCG1p/gQT/Ou6OVGTYlhil29P+77lhphqXcj4Z4Ur38hYQxze0ZV
         t7lulJt7bR5hoZ9h0xlmAXKBIAgHam3HL00dya861MqrK44lrH4TmNJs4ySkaPtgUuBP
         sEe4lbZdn6o5AWuZCmVnh6npMNx4zEdyrjBKGigCvzWIbnwVm1ibj8APi5IWq37q+5IR
         9QtIeJbInaZ2Ck6n7wcYXOFQRzd6Yy6CGljqnucI0HH40pwvnDmEMKCapHqr64qEL9M+
         SWO3U0xSHMmJTcQEP4bBdw3jfXA1KX6tPuRWAuFTWteBJgEQiO955U50zuVNdXrtUGqQ
         1FNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700599130; x=1701203930;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o5WQccnjZgaS7AdFyMCtckY+Ntl4rQUUFl7+OMDJuQI=;
        b=wGmHoz3grFShM2RJrBhvCskCQFL2tnIHaFy8QCuPxKa0MXCkhKZ6NfyfVKQV9x99yf
         HccEQIXDtXN9j6caHv2FtA2E6Flk0Q5Bgf5FpUGTn01yN9sEwixOWu7q+ixqvRmEZQjp
         htS9P+A3dj/SWBMFx+VNH3ACgXDjXvdm5780RlOPxHlTA5MRAp63Dw65IMobffKZ/n/n
         tkyNAD0g1lTPFu47AbNDmCJQazVTtPbmEskiauK6Iepug4ozwTlC+9CddVZM0RHgeMGv
         hHPZx1ZN3jmHpG/voi+9XuPDKI9W4ad/uKl6iSEcUJC/orfQIibwQiPE0anENfqjEbfX
         fpSw==
X-Gm-Message-State: AOJu0YygY0kBIe1Ircr8SYAX8qnwhwP9ZiDWOHlNQ47w5ucdjtf8CWBj
	gCXS/HIT5cQA0oWYpZ5ak+L5slzEsRkBHC0=
X-Google-Smtp-Source: AGHT+IHCTQTIAMoy10E+nvzy7nHVvGzyzQV56a5uGSOpbDPWo9CwIH27+2EkbE2yhxm9W4XjY44lbDYDgKxz7cE=
X-Received: from rdbabiera.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:18a8])
 (user=rdbabiera job=sendgmr) by 2002:a25:8741:0:b0:d9b:e3f6:c8c6 with SMTP id
 e1-20020a258741000000b00d9be3f6c8c6mr2166ybn.4.1700599130296; Tue, 21 Nov
 2023 12:38:50 -0800 (PST)
Date: Tue, 21 Nov 2023 20:38:46 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=639A331F1A21D691815CE090416E17CA2BBBD5C8
X-Developer-Signature: v=1; a=openpgp-sha256; l=977; i=rdbabiera@google.com;
 h=from:subject; bh=ZYsgqVxALhhygiFNzzMFz0Ybgo3pXY9d4YO+IaLS/I8=;
 b=owGbwMvMwCFW0bfok0KS4TbG02pJDKmxoqFP41Kf3b0/dd1cpoSr2iu81Q/d771b+Hb7Q/0yx
 qklMkybO0pZGMQ4GGTFFFl0/fMMblxJ3TKHs8YYZg4rE8gQBi5OAZjI+YkM/1Sjb1tNkLcWsrda
 1nlTTG27RtreHR3bJzmfdw7ivlGsm8jwP2mBh7jW+h/aj2L/6GWIsvudsvx0wMkidRXrjiMbEvV y2AA=
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
Message-ID: <20231121203845.170234-4-rdbabiera@google.com>
Subject: [PATCH v1 0/2] usb: typec: handle tcpc vconn oc fault by triggering
 tcpm error recovery
From: RD Babiera <rdbabiera@google.com>
To: linux@roeck-us.net, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, badhri@google.com, 
	RD Babiera <rdbabiera@google.com>
Content-Type: text/plain; charset="UTF-8"

When a Vconn swap results in a Vconn over current fault, typec port
interoperability is affected and cannot be recovered unless the connection
is reset and restablished.

The tcpm currently does not have an export symbol to set the port to the
error recovery state in the event of tcpc faults. This patch set adds
tcpm_port_error_recovery for tcpci drivers to use when a fault should
result in a connection reset. Vconn over current fault handling is added
to the maxim tcpci driver.

RD Babiera (2):
  usb: typec: tcpm: add tcpm_port_error_recovery symbol
  usb: typec: tcpci: add vconn over current fault handling to maxim_core

 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 20 +++++++++++++++++++-
 drivers/usb/typec/tcpm/tcpm.c             | 14 ++++++++++++++
 include/linux/usb/tcpci.h                 |  5 ++++-
 include/linux/usb/tcpm.h                  |  1 +
 4 files changed, 38 insertions(+), 2 deletions(-)

-- 
2.43.0.rc1.413.gea7ed67945-goog


