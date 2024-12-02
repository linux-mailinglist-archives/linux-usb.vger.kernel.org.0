Return-Path: <linux-usb+bounces-17984-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3173A9DF781
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2024 01:17:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F395A162788
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2024 00:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69296B640;
	Mon,  2 Dec 2024 00:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="ayYhCXWS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5334A08
	for <linux-usb@vger.kernel.org>; Mon,  2 Dec 2024 00:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733098615; cv=none; b=jCw64IWOTj9XrARh3YNHIlVr2J5u5yySpsO94zgQzo8nXixDfVL2/5qb/LmVXaAsVlSSZe2gU8L7QxvAN7I6x0Y0S11QXtrWlZMD2SOz1WfW/54nIlHNoZh4IVh7Ff+G1TK7QG8BohWbzA4lTbDBf4uSLQxYHFu/T4VRIYn/QsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733098615; c=relaxed/simple;
	bh=x3yz/DFTuNPJjqVZxiw0kfbfBDJ78/CfuR9eJ2d7E58=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g1xizp4nrT30NSbuMx8EynrcZXBQcfVXU+qjK4a8SA1Q0b9GJMTMwbNcbXxM7dG17DnrN5aGyMSr5o84OGFv6UAIjheIo4XzPa0+/adjM64qjmpVSoxKibFOQUh4pqu4RBdkZSBDxh2vgGcoblW/O0OYsTJguvo6QJoUTYvbUD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=ayYhCXWS; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1733098599; x=1733703399; i=wahrenst@gmx.net;
	bh=savipbmLhTx7LIXVXD8Lvdul953yNxuStkQ1uEsHqYI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ayYhCXWS5ZLEfAi3WGziZTsJQ/215rBdef6+V03rVoal2obkKLt5UkVDuo1R5SxO
	 u+4DtO2ku5sjUrKNpEDKuvsLQUai9mA3bxgZKPyLZxmfbEZPHtnDtRO7CWI6P3sVP
	 AkpUwZeYHsj5vWTCjyuh6QhSptGA4CICllCe7s/wCaKY/AlQSqzN3ToEAL44p5P3O
	 LKl0IVE8vLjbt+dK3MA854EhTvDLzppHkd6knlBWiK798ZvEpP6SlEq/pJmuhPGBQ
	 ncMRIsWq8YzYd1tQqk7o3xoqnmzlmHeHHsd6/3S3rhGEsLE1i3ke1dfhCALB3qE+m
	 A4bhGEwDfcMfXpO2kQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQvCv-1t4LJI1LbL-00VigD; Mon, 02
 Dec 2024 01:16:39 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
	Douglas Anderson <dianders@chromium.org>,
	Lukas Wunner <lukas@wunner.de>,
	Peter Robinson <pbrobinson@gmail.com>,
	"Ivan T . Ivanov" <iivanov@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 2/3] usb: dwc2: hcd: Fix GetPortStatus & SetPortFeature
Date: Mon,  2 Dec 2024 01:16:30 +0100
Message-Id: <20241202001631.75473-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202001631.75473-1-wahrenst@gmx.net>
References: <20241202001631.75473-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ylSSHTQV4E3SYFVCQAPBWkD1qDiPe7LExFSl1jmro7feAr/+Sc5
 +0YnKiEhUDvpY6eNY14d0ikeRLclOaCCWE1c6QNTJKv5EhR2HvrC4R1y+PoEAGJXyle5kMM
 ATotZgnL6/dm6UL8QKUnK3mxC1ju2PuFknzjBnzHYMV3/1Wcetr/dlUCxghU+iVOlzHvPue
 QE6OxNil1CqpZg+ArZfEw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pAVUCQoHj+Q=;MJtKgxIBAAnPdvLH0ezLsSJ5Mmm
 cvrqqz300fi4igVC6+R9KaeXs1tokNTDCaLZyuDzSXHeZcNcv3jWCw0uxN3VwXVQY5yfr7Pow
 z9LHGF3X8WI9cufyudtb429YCgQdcMJZ4wqy57mIdWiuhUqoGF1QRDvYhM+BHEDUqkMcq1yjV
 q7VxcJNfihWYLStzJCrffOSnGOHRzYySGtfEVBEKSeu2DBqy+IzdsftKfSmVVWtHvHqQ0yuiz
 38DUJHcAmdqrpwmQ0B2U3c5csFgGFlzRpPUyPz8Cf7nh/GeIgR7D57MHaGP8oEDjrrvynxoji
 6npC8BfxaSpKW2iK5f2NmuYap2citvZzKJtIwwqBPRd+hD4wnBtKhIB64LLFxlzdWzpnIZNW7
 qMCMsx97cFtNPW6yJ+9ChPEIxU+feDpgCL2efikPdwqFJVMvmrkH++Y7FEF1XVrH4XePXiPd+
 769XXupriYDK0yVbcq4DwBFnM4Ki03z+KN3PSNBKDL/05sGe/+5chIwgOZLh63ifs6TNdrCvo
 fkw23V52cqyOZGyIkHMp/jFsBsBnT7glJsle0jBz4DgHVinNKOlwN49+KywzjhsfLmAwZ/L+3
 cudxflBnzMLDXKbeVhfngpGm7kufF2tz3ZhnAw2DVMSGEasI1fc5B7Mmoug0M/4Qvg6u5R7wv
 CGT+E3qGn8yFzkb5+zihFRL0XYVf8czRCj98UbYElI6/mpl2Tww2VU9/rZCaj0ztCUL9Bx1BX
 LRSR+1s7OJEN0xhVJGCxwOFA++kRvIHVjRGhuaAjxCqWCZ1jiluVhZk6Uu4MqW0tXouI54XCl
 uz7w2OTfgULEIPhrJmhYQCGX7G2bNd/IDTIJ6QICOoPV1EjIIf05IAt7vGlN6ueewnvFWO12c
 XgRsU+FCGvBlC4CqrpFN3FIzXh8ZW8Gn8bJGm8kMrLSmEVJehLb/y4HFPJ4NNhH6RNH9SJiWb
 Go3O/2QuQT2GZ7P17eUx1Me0ufuiQw4Cy2XFDTR3Xd2+fBhkkgO8z8790RFIVBBFWjEZ1xHhW
 oO14qKHNeoJBNIUTFmlP+O24PGB9DTxdUkSxJRjSoOrozlCx2FTqSEoVWFy4VIKZgizcnKK7C
 v1MCmexkx4W0BIerrQKLgiNtauwaIZ

On Rasperry Pis without onboard USB hub the power cycle during
power connect init only disable the port but never enabled it again:

  usb usb1-port1: attempt power cycle

The port relevant part in dwc2_hcd_hub_control() is skipped in case
port_connect_status =3D 0 under the assumption the core is or will be soon
in device mode. But this assumption is wrong, because after ClearPortFeatu=
re
USB_PORT_FEAT_POWER the port_connect_status will also be 0 and
SetPortFeature (incl. USB_PORT_FEAT_POWER) will be a no-op.

Fix the behavior of dwc2_hcd_hub_control() by replacing the
port_connect_status check with dwc2_is_device_mode().

Link: https://github.com/raspberrypi/linux/issues/6247
Fixes: 7359d482eb4d ("staging: HCD files for the DWC2 driver")
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/usb/dwc2/hcd.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index 26a320c1979a..fb4fbd8c43df 100644
=2D-- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -3546,11 +3546,9 @@ static int dwc2_hcd_hub_control(struct dwc2_hsotg *=
hsotg, u16 typereq,
 			port_status |=3D USB_PORT_STAT_C_OVERCURRENT << 16;
 		}

-		if (!hsotg->flags.b.port_connect_status) {
+		if (dwc2_is_device_mode(hsotg)) {
 			/*
-			 * The port is disconnected, which means the core is
-			 * either in device mode or it soon will be. Just
-			 * return 0's for the remainder of the port status
+			 * Just return 0's for the remainder of the port status
 			 * since the port register can't be read if the core
 			 * is in device mode.
 			 */
@@ -3620,13 +3618,11 @@ static int dwc2_hcd_hub_control(struct dwc2_hsotg =
*hsotg, u16 typereq,
 		if (wvalue !=3D USB_PORT_FEAT_TEST && (!windex || windex > 1))
 			goto error;

-		if (!hsotg->flags.b.port_connect_status) {
+		if (dwc2_is_device_mode(hsotg)) {
 			/*
-			 * The port is disconnected, which means the core is
-			 * either in device mode or it soon will be. Just
-			 * return without doing anything since the port
-			 * register can't be written if the core is in device
-			 * mode.
+			 * Just return 0's for the remainder of the port status
+			 * since the port register can't be read if the core
+			 * is in device mode.
 			 */
 			break;
 		}
=2D-
2.34.1


