Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A89731BD7A1
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 10:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbgD2Iwp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 04:52:45 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:60717 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726355AbgD2Iwo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Apr 2020 04:52:44 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MrhHm-1irPbu00FI-00nf9b; Wed, 29 Apr 2020 10:52:14 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "K V, Abhilash" <abhilash.k.v@intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Guenter Roeck <linux@roeck-us.net>,
        Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: fix ucsi_register_port_psy typo
Date:   Wed, 29 Apr 2020 10:52:04 +0200
Message-Id: <20200429085211.2879411-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hFhdiosld5ofHHkPI8iLw2JhWCIMpoNdcCH6yPFSnh+PI9J6beH
 prrguzTWXosdCQsA5yMyGKQ3+Kf7GmZLZn0+RK54NLTevKMHSwUui08ZYtbc94l+1VNgg6n
 KWJoG8XvIAZknraPuropIAqvtioGHNTzh0Esn82AN/Ml8a9x/dvI1hsnrzg80LmswHrM5N8
 RcUCZx+hA4iCse8wDmGrA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DPZBLezuGBM=:okfMjeJu0HbZvFi1T8Qv9A
 d41mdD6Ug+XEBEafx9YHpJSIMIEP284JRPL5+4nxHFfcfi34ExnpHuLhH+2xb6/v9/5Uj9akP
 fCO9/dX4EgM8CU6F1FGZeD88DSlIlxdlh1rrPYTnS4iy6f1EzigJcqH5/xw8BZnYEkeyNSmIs
 B8yyLSiDSa2TXArfHIA0SpCqVmBIkgBTFJufc0rEXyN7YQfNB7NkXYnV820SUO0+GKP9Ntg92
 uv8yy9ApMkLXIyFdSx87kU/3Aka8QXgdHKm9/STqRWDJ+8vepfaGwf7cgKAY8FGqM6IYGKrGu
 ITsIQkwQKyWr4RRHrAlbE7FfQJpiUJLnXBPR2QujPlA9+4ehk1QuKzr7eDlN4Bc3DNhTv9Ga3
 ZPEjcTJTzzTlRpzBnHb9i0rT2oWA7fxRPN5OcG/fnWbWLxnnc+mMOIuG1fwxbQZUHC7svgYe1
 qzhvM/PuwM6x55z/lyUI8ckjMtkRYvGG1iilT17XGWNFVn7H2t9SSee5yhF+S2suo26iOWiSN
 bhmZjjRFUM6jGw0jzu8YiZbkBDyT972ZBt1X4MZ7GtZWM0htDNwEtPUgOo3AuRvQhSCeme2om
 M88XAdKJsA06QWCRYC4UKtIgfoVSEnHh8a/fg/WCHByzXP4hLMnpIDD170RfEFoLkNDEcvqGq
 /LzWtLQvWH2fvDwTQ9X7YHRslswofrI2RxFTC1HWSu89L8O8SCs1xYpRcYNLijljCIHXTK50j
 UEeU9O0mFDmyngW1tybWd+OY8LkZHXZvdbvVwa098flCxw4sFscktYn3PH5yXzMQ30l5jeCkJ
 bv7eTjSdbDB3I0iHae0m5FO9sSGgthxMOyk0nBY7vBj7UJFbVQ=
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The dummy function in the header file has the wrong name,
conflicting with a local ucsi_register_port function:

drivers/usb/typec/ucsi/ucsi.c:890:12: error: conflicting types for 'ucsi_register_port'
  890 | static int ucsi_register_port(struct ucsi *ucsi, int index)
      |            ^~~~~~~~~~~~~~~~~~
In file included from drivers/usb/typec/ucsi/ucsi.c:17:
drivers/usb/typec/ucsi/ucsi.h:344:19: note: previous definition of 'ucsi_register_port' was here
  344 | static inline int ucsi_register_port(struct ucsi_connector *con) { return 0; }
      |                   ^~~~~~~~~~~~~~~~~~
drivers/usb/typec/ucsi/ucsi.c: In function 'ucsi_register_port':
drivers/usb/typec/ucsi/ucsi.c:939:8: error: implicit declaration of function 'ucsi_register_port_psy'; did you mean 'ucsi_unregister_port_psy'? [-Werror=implicit-function-declaration]
  939 |  ret = ucsi_register_port_psy(con);
      |        ^~~~~~~~~~~~~~~~~~~~~~
      |        ucsi_unregister_port_psy

Fixes: 992a60ed0d5e ("usb: typec: ucsi: register with power_supply class")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/usb/typec/ucsi/ucsi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index e52b5540b254..cba6f77bea61 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -341,7 +341,7 @@ int ucsi_resume(struct ucsi *ucsi);
 int ucsi_register_port_psy(struct ucsi_connector *con);
 void ucsi_unregister_port_psy(struct ucsi_connector *con);
 #else
-static inline int ucsi_register_port(struct ucsi_connector *con) { return 0; }
+static inline int ucsi_register_port_psy(struct ucsi_connector *con) { return 0; }
 static inline void ucsi_unregister_port_psy(struct ucsi_connector *con) { }
 #endif /* CONFIG_POWER_SUPPLY */
 
-- 
2.26.0

