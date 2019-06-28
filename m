Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15C5C5A37D
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2019 20:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbfF1SYe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jun 2019 14:24:34 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35210 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbfF1SYd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jun 2019 14:24:33 -0400
Received: by mail-pf1-f195.google.com with SMTP id d126so3399772pfd.2
        for <linux-usb@vger.kernel.org>; Fri, 28 Jun 2019 11:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PDI+SV9GVbs38aQev8L4wXqHdjl41NulymWKKVfYEMs=;
        b=qYrnaW3lA1R/6Lwx4ACSRpppLZSqj/nsm3HWJ/XyVJwBmDMDUednPJzQch3mC+6g81
         cPJ9u2y2ef5RaRc4afkelF71jKIGTM6gU1NZtMwdTJngKcmKhXrSuxlNPocHnozZLmvs
         oR2JXHYWYgFKOZk1ELyxIUUZhBKMm4lp/A2PL4hNsaczXpzhQy3Z024AghkMA5TLL0VQ
         EdGdtVc+6BVpxJeup6O0MuUV17IsSM5fRlQvXnPxWQgr91vTI4uVmTQ8gakEk5WDCYwi
         vh0wbNusAu55fvfNftAaOQjKXrnSj1YPFpRzKidXW+9Sr9de4iFTLvHi9AYeaQTpguGC
         evfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PDI+SV9GVbs38aQev8L4wXqHdjl41NulymWKKVfYEMs=;
        b=jlnvym2qj9f+r8CKML88TIgW+TV6ib35Ah5OShb2Qklcyd9NBqmI+5X39dZclQ8vaC
         PUa1IlevT+DdmilwF8qR2t4440W4y0dBZuQRDI+Bpt7AB9zofN+WTKy7gsT7c/Ob5dyg
         KJvLnCDVmnqYjOW8LqiKbrWiCwe5X4vIo1OuRURhH7idVT4hCR1cmMBly3jy1maIQRz2
         975BVntmhGLZTbeOy6DSP+xax5SopmN6Vp7YfqWIRAlQHKxKsMhz6DXo2dLgqKYpA5Lc
         0RWA/TTPvTWZCsztEPZiABQgKjQJ/HOdQlOTR5RLzMf4QGtUP/bMRocJwoE45XVn3A5c
         PxoA==
X-Gm-Message-State: APjAAAXo/JPXWUZPf50zWASCetONU4WQUzmLAx/yc3xrezTEQpxASgp3
        QpCJw7EVWBPL7FvsdUjuG8mgAA==
X-Google-Smtp-Source: APXvYqy5EteuxJPd8uSp7RfKzmDXMzcgaoORnjNlj/kg/wwocf9+URJb3sIck64ZvXt+s++AWxRmvA==
X-Received: by 2002:a17:90a:9f08:: with SMTP id n8mr14979208pjp.102.1561746272721;
        Fri, 28 Jun 2019 11:24:32 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id s15sm2916223pfd.183.2019.06.28.11.24.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 28 Jun 2019 11:24:31 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     stable@vger.kernel.org
Cc:     Jack Pham <jackp@codeaurora.org>, Fei Yang <fei.yang@intel.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        John Stultz <john.stultz@linaro.org>
Subject: [PATCH 4.19.y v2 9/9] usb: dwc3: gadget: Clear req->needs_extra_trb flag on cleanup
Date:   Fri, 28 Jun 2019 18:24:13 +0000
Message-Id: <20190628182413.33225-10-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190628182413.33225-1-john.stultz@linaro.org>
References: <20190628182413.33225-1-john.stultz@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Jack Pham <jackp@codeaurora.org>

commit bd6742249b9ca918565e4e3abaa06665e587f4b5 upstream

OUT endpoint requests may somtimes have this flag set when
preparing to be submitted to HW indicating that there is an
additional TRB chained to the request for alignment purposes.
If that request is removed before the controller can execute the
transfer (e.g. ep_dequeue/ep_disable), the request will not go
through the dwc3_gadget_ep_cleanup_completed_request() handler
and will not have its needs_extra_trb flag cleared when
dwc3_gadget_giveback() is called.  This same request could be
later requeued for a new transfer that does not require an
extra TRB and if it is successfully completed, the cleanup
and TRB reclamation will incorrectly process the additional TRB
which belongs to the next request, and incorrectly advances the
TRB dequeue pointer, thereby messing up calculation of the next
requeust's actual/remaining count when it completes.

The right thing to do here is to ensure that the flag is cleared
before it is given back to the function driver.  A good place
to do that is in dwc3_gadget_del_and_unmap_request().

Fixes: c6267a51639b ("usb: dwc3: gadget: align transfers to wMaxPacketSize")
Cc: Fei Yang <fei.yang@intel.com>
Cc: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: linux-usb@vger.kernel.org
Cc: stable@vger.kernel.org # 4.19.y
Signed-off-by: Jack Pham <jackp@codeaurora.org>
Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>
(cherry picked from commit bd6742249b9ca918565e4e3abaa06665e587f4b5)
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/usb/dwc3/gadget.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 843586f20572..e7122b5199d2 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -177,6 +177,7 @@ static void dwc3_gadget_del_and_unmap_request(struct dwc3_ep *dep,
 	req->started = false;
 	list_del(&req->list);
 	req->remaining = 0;
+	req->needs_extra_trb = false;
 
 	if (req->request.status == -EINPROGRESS)
 		req->request.status = status;
-- 
2.17.1

