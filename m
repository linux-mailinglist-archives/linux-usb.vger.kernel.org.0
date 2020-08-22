Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3110324E648
	for <lists+linux-usb@lfdr.de>; Sat, 22 Aug 2020 10:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgHVIJ0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 22 Aug 2020 04:09:26 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:14205 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726765AbgHVIJW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 22 Aug 2020 04:09:22 -0400
X-UUID: cf7133a7f1ee4fb2aff198f02af3923c-20200822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=RiKpsCZJex/4PNC9PXP3CBjdPJWYcy6TOG9QBDJhfJg=;
        b=Of95Kyv2mSS7DE2lIaR0cwPQDX9Z89RiVNdPNq4e1zoPDR+Hm9YfKNtmtN/CdNApQ3XtaPOO5uM1x5Tk300xJOBbKPc/1HYbN5ztTZso6NBXuGLymNuhd3zOGV0fnfUexOfZnj8i6xLwAhycIotvsPKhKFbrcX8aMjpgIW/5Z40=;
X-UUID: cf7133a7f1ee4fb2aff198f02af3923c-20200822
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 853196341; Sat, 22 Aug 2020 16:09:17 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 22 Aug 2020 16:09:17 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 22 Aug 2020 16:09:15 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Felipe Balbi <balbi@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Lee Jones <lee.jones@linaro.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v3 09/11] usb: phy: phy-mv-usb: convert to readl_poll_timeout_atomic()
Date:   Sat, 22 Aug 2020 16:05:51 +0800
Message-ID: <1598083553-31896-9-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1598083553-31896-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1598083553-31896-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: CB82458CE3DF942285E05F81EA451D2BF7C3E37234F9B84CF016E41C0EA717E42000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

VXNlIHJlYWRsX3BvbGxfdGltZW91dF9hdG9taWMoKSB0byBzaW1wbGlmeSBjb2RlDQoNClNpZ25l
ZC1vZmYtYnk6IENodW5mZW5nIFl1biA8Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4NCi0tLQ0K
djM6IHJlLWFsaWduIGFyZ3VtZW50IG9mIGxvZyBzdWdnZXN0ZWQgYnkgU2VyZ2VpDQoNCnYyOiB1
ZGVsYXkgMTB1cyBpbnN0ZWFkIG9mIDIwdXMgYWNjb3JkaW5nIHRvIGtlcm5lbGRvYw0KLS0tDQog
ZHJpdmVycy91c2IvcGh5L3BoeS1tdi11c2IuYyB8IDE4ICsrKysrKysrLS0tLS0tLS0tLQ0KIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy91c2IvcGh5L3BoeS1tdi11c2IuYyBiL2RyaXZlcnMvdXNiL3BoeS9waHkt
bXYtdXNiLmMNCmluZGV4IGNlNzY3ZWMuLjU3NmQ5MjUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3Vz
Yi9waHkvcGh5LW12LXVzYi5jDQorKysgYi9kcml2ZXJzL3VzYi9waHkvcGh5LW12LXVzYi5jDQpA
QCAtOCw2ICs4LDcgQEANCiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQogI2luY2x1ZGUgPGxp
bnV4L2tlcm5lbC5oPg0KICNpbmNsdWRlIDxsaW51eC9pby5oPg0KKyNpbmNsdWRlIDxsaW51eC9p
b3BvbGwuaD4NCiAjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPg0KICNpbmNsdWRlIDxsaW51eC9k
ZXZpY2UuaD4NCiAjaW5jbHVkZSA8bGludXgvcHJvY19mcy5oPg0KQEAgLTEzNSw4ICsxMzYsOCBA
QCBzdGF0aWMgaW50IG12X290Z19zZXRfdGltZXIoc3RydWN0IG12X290ZyAqbXZvdGcsIHVuc2ln
bmVkIGludCBpZCwNCiANCiBzdGF0aWMgaW50IG12X290Z19yZXNldChzdHJ1Y3QgbXZfb3RnICpt
dm90ZykNCiB7DQotCXVuc2lnbmVkIGludCBsb29wczsNCiAJdTMyIHRtcDsNCisJaW50IHJldDsN
CiANCiAJLyogU3RvcCB0aGUgY29udHJvbGxlciAqLw0KIAl0bXAgPSByZWFkbCgmbXZvdGctPm9w
X3JlZ3MtPnVzYmNtZCk7DQpAQCAtMTQ2LDE1ICsxNDcsMTIgQEAgc3RhdGljIGludCBtdl9vdGdf
cmVzZXQoc3RydWN0IG12X290ZyAqbXZvdGcpDQogCS8qIFJlc2V0IHRoZSBjb250cm9sbGVyIHRv
IGdldCBkZWZhdWx0IHZhbHVlcyAqLw0KIAl3cml0ZWwoVVNCQ01EX0NUUkxfUkVTRVQsICZtdm90
Zy0+b3BfcmVncy0+dXNiY21kKTsNCiANCi0JbG9vcHMgPSA1MDA7DQotCXdoaWxlIChyZWFkbCgm
bXZvdGctPm9wX3JlZ3MtPnVzYmNtZCkgJiBVU0JDTURfQ1RSTF9SRVNFVCkgew0KLQkJaWYgKGxv
b3BzID09IDApIHsNCi0JCQlkZXZfZXJyKCZtdm90Zy0+cGRldi0+ZGV2LA0KLQkJCQkiV2FpdCBm
b3IgUkVTRVQgY29tcGxldGVkIFRJTUVPVVRcbiIpOw0KLQkJCXJldHVybiAtRVRJTUVET1VUOw0K
LQkJfQ0KLQkJbG9vcHMtLTsNCi0JCXVkZWxheSgyMCk7DQorCXJldCA9IHJlYWRsX3BvbGxfdGlt
ZW91dF9hdG9taWMoJm12b3RnLT5vcF9yZWdzLT51c2JjbWQsIHRtcCwNCisJCQkJKHRtcCAmIFVT
QkNNRF9DVFJMX1JFU0VUKSwgMTAsIDEwMDAwKTsNCisJaWYgKHJldCA8IDApIHsNCisJCWRldl9l
cnIoJm12b3RnLT5wZGV2LT5kZXYsDQorCQkJIldhaXQgZm9yIFJFU0VUIGNvbXBsZXRlZCBUSU1F
T1VUXG4iKTsNCisJCXJldHVybiByZXQ7DQogCX0NCiANCiAJd3JpdGVsKDB4MCwgJm12b3RnLT5v
cF9yZWdzLT51c2JpbnRyKTsNCi0tIA0KMS45LjENCg==

