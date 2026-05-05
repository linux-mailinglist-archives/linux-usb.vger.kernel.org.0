Return-Path: <linux-usb+bounces-36919-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEPsOaWw+Wld/AIAu9opvQ
	(envelope-from <linux-usb+bounces-36919-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 10:56:05 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8974C8F8C
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 10:56:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2AEA8301A08E
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2026 08:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E2B3CCA12;
	Tue,  5 May 2026 08:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HU6Fc1d0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418F03B38A1;
	Tue,  5 May 2026 08:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777971313; cv=none; b=cJY+LjQPCXbinViXMEWE0JjjUW4rBR3XfTxEWBXS+3WldpFNkrCWTdanyNO5m6sHbkpSgU+Va6Nr8xkCgGsGh5nQWnTg553RbgejJukwabompM8rVQwacKDHdshVyALfWPziKzbNnUoxw2wothNruRstsiAnHbFb2s2oIo5NgUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777971313; c=relaxed/simple;
	bh=Cbu/UYWwsQNiNL9tn8iyYNCBVKNpIpa5mfFUS/YMaV8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PymHu/JsPv1qtXVeZVhr8wiUdlkEvJyjI5m6Y5N0gAgVle+xFQEpCKCVJ5J1lpDmVPOprIyVWd1BDkV1oPUfI5huKgdRsCngkTLxLb5HxDHFTusNeOQkMNykCoinlF6zWApPkv+4h20EIDT465FkDWhDST2mKWZxcxBpmy1/zyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HU6Fc1d0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99BEC2BCB4;
	Tue,  5 May 2026 08:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777971312;
	bh=Cbu/UYWwsQNiNL9tn8iyYNCBVKNpIpa5mfFUS/YMaV8=;
	h=From:Subject:Date:To:Cc:From;
	b=HU6Fc1d08hkmgsLDc8azh+EnU3uQ6dG/+SJ1h3P9xtXyWSiYXMyi56zR/3yPOtHAV
	 RB3QR+2sStkOa/JzJ6v8jLlwmQ+tFthC8RHlh+jFgjQG2oXL+WVxshB/jW77mxQm5R
	 IPGP5yUZgm1kFPYq67x+1Kvmn1uVc8u23ZnspLQOF+PDpWW/Lgq60hO43sp/qV9H8V
	 AZQ+XrhbEc0Tkk9a1yaNOj7rlrc3Ui47w6KaEekB5Yaz1DDt4pSVIw/kGlgwolZA0j
	 vvIgWFNLaLgOQggSu1ikVBhcMJtqhPsv7OX4XZ7ax1ZVUGiMAfI5dx5ZVTbxKuG9YP
	 yMkZKl98ZDRjA==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/2] DWC3 link tunneling state reporting
Date: Tue, 05 May 2026 10:55:03 +0200
Message-Id: <20260505-topic-dwc3_tunneling_state-v1-0-4aaa6c3c14cb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCQAwAwK+UnF1IW1eKXxEpaxprRNKySVUo/
 burHucyKxhnYYNjtULmp5hMWlDvKqBb0pGDDMXQYHPAiPvg0ywUhhe1vS+q/BAde/PkHCLGriP
 kOnELJZgzX+X9y0/nv2253Jn8O8K2fQCPMOqGfgAAAA==
X-Change-ID: 20260504-topic-dwc3_tunneling_state-50588c0e1ae3
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777971309; l=1564;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=Cbu/UYWwsQNiNL9tn8iyYNCBVKNpIpa5mfFUS/YMaV8=;
 b=B0epUcuqSvCCpt/D71oeWrEVQUwYiB5fhEcSlaf9lR4ri0Wyvxy5RgIzJIr+nw+7Wb76Ytzua
 KXkh7Wz58qJAFtz18QPpNjlAmnUsFMLipo/X8NN3KGVKIlk84aBjnP0
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: EE8974C8F8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36919-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,oss.qualcomm.com:mid]

Currently, retrieving the tunneled/native state of a running port is
only possible on Intel XHCI hosts. This series extends that to CIO-
capable DWC31 controllers (see [1]).

Note that this patchset only results in the correct udev->tunnel_mode
value being assigned. Creating the device links (which requires this
information) between the USB4 router and the USB3 controller does not
currently take place on DT-based platforms, but that will be amended
in a follow-up patchset.

Tested on a Qualcomm X1E80100 CRD board, with a (currently) out-of-tree
set of drivers.

[1] I'm not entirely sure about the DWC version range (particularly
    wrt DWC32 and newer), so I limited it to a reasonable subset. I'll
    happily amend that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (2):
      usb: host: xhci: Allow non-Intel usb_link_tunnel_mode reporting
      usb: dwc3: Notify XHCI core of tunneled status

 drivers/usb/dwc3/core.c      | 12 ++++++++++++
 drivers/usb/dwc3/core.h      | 18 ++++++++++++++++++
 drivers/usb/dwc3/host.c      | 12 ++++++++++++
 drivers/usb/host/xhci-hub.c  |  4 ++--
 drivers/usb/host/xhci-plat.c |  2 ++
 drivers/usb/host/xhci-plat.h |  1 +
 drivers/usb/host/xhci.c      |  6 +++++-
 drivers/usb/host/xhci.h      |  5 ++++-
 8 files changed, 56 insertions(+), 4 deletions(-)
---
base-commit: b9303e6bff706758c167af686b5315ad00233bf8
change-id: 20260504-topic-dwc3_tunneling_state-50588c0e1ae3

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


