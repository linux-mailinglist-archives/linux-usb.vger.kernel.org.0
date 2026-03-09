Return-Path: <linux-usb+bounces-34308-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGabERvarmmKJQIAu9opvQ
	(envelope-from <linux-usb+bounces-34308-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 15:32:59 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C850D23A909
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 15:32:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE7BD307AA06
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 14:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D023D301D;
	Mon,  9 Mar 2026 14:29:12 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D733B893E;
	Mon,  9 Mar 2026 14:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.46.229.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773066551; cv=none; b=nfmFJabHZICUEuF0l8RJZdV5X3aZrVSLXQjWi7yWShEhAcH453gocIciB//dQIKH7EtdHD0s+Hr/DTFEUOgdKTBo5Plj4E0Q410IjwgCUN3H1WtIEOkn+1Fsmy9UaR0K8UOdLdpZUd2U4vkipE/ymHxt4szX4LtvLo1zQaHmkNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773066551; c=relaxed/simple;
	bh=gEkXNg6CdBbBCtNDi4rMq0WdvbKKOUxETo8K6bNi5VM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q3xEQkgJr+BebyNrN4ZZ17mckYmO8TtAcxc7vM772XjSgi8fPsMtHsftxK9IhUcPcjNBS7OngqW3q0cgc2e0PXGhrG9UD4dkwxrqO6JlI5BlWmzYJNpge9YVTeetsdWj3GFyYho1+SXfipPkjynh4sEfnXyRnIrLn15ts2w/gjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=207.46.229.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [10.98.66.117])
	by mtasvr (Coremail) with SMTP id _____wA3LGcn2a5pqPYiAQ--.44858S3;
	Mon, 09 Mar 2026 22:28:56 +0800 (CST)
Received: from localhost.localdomain (unknown [10.98.66.117])
	by mail-app1 (Coremail) with SMTP id yy_KCgDXUNom2a5pS_CMBg--.53191S2;
	Mon, 09 Mar 2026 22:28:54 +0800 (CST)
From: Fan Wu <fanwu01@zju.edu.cn>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fan Wu <fanwu01@zju.edu.cn>
Subject: [PATCH] USB: serial: opticon: fix UAF in write callback during port removal
Date: Mon,  9 Mar 2026 14:27:57 +0000
Message-Id: <20260309142757.589802-1-fanwu01@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:yy_KCgDXUNom2a5pS_CMBg--.53191S2
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?nQ48iQXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfnTvtdAQ+gzDzcUufjJMvYC0gZ/v+e8PQo0P2J8rX3FFi7CN96yV0USBkG2sgPwU49zsO
	4gkRxQ3sT2+7yyLW/V6p9E6mavGmQbzmcFsnzP86
X-Coremail-Antispam: 1Uk129KBj93XoW7CFyrXr4rAFW5ur1xGFyrXwc_yoW8Ar1fpa
	yakFW3GF10qr13Xr1DJF1DXFyUWw4UJFy2gF92grWrXr1ava18Ja4IywnYyryxJF9rtrZI
	934qv3yrGFy5trbCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Gb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804V
	CY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AK
	xVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48Icx
	kI7VAKI48JM4x0Y48IcxkI7VAKI48G6xCjnVAKz4kxMxAIw28IcxkI7VAKI48JMxC20s02
	6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj4
	0_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8
	JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8Tv3UUUUUU==
X-Rspamd-Queue-Id: C850D23A909
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DMARC_NA(0.00)[zju.edu.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34308-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.631];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FROM_NEQ_ENVFROM(0.00)[fanwu01@zju.edu.cn,linux-usb@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,zju.edu.cn:mid,zju.edu.cn:email]
X-Rspamd-Action: no action

The opticon driver anchors write URBs to priv->anchor in opticon_write()
and frees priv in opticon_port_remove() without first killing these
anchored URBs. The completion callback opticon_write_control_callback()
may dereference priv via usb_get_serial_port_data() and access
priv->lock, priv->outstanding_urbs, and priv->outstanding_bytes after
it has been freed.

If a write URB is in flight when the port is removed:

    CPU 0 (remove path)              CPU 1 (URB completion)
    ---------------------            ---------------------
    opticon_port_remove()
      kfree(priv)  <--+
                     |  --> opticon_write_control_callback()
                     |        priv = usb_get_serial_port_data()
                     |        spin_lock_irqsave(&priv->lock)
                     |        --priv->outstanding_urbs  // possible UAF
    return           |
                     usb_free_urb()

Fix this by calling usb_kill_anchored_urbs(&priv->anchor) before
kfree(priv) so that all in-flight URBs have finished before the private
data is freed.

Note that opticon_close() already correctly kills anchored URBs; this
fix addresses the port_remove path which was overlooked.

Fixes: 648d4e16567e ("USB: serial: opticon: add write support")
Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
---
 drivers/usb/serial/opticon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/serial/opticon.c b/drivers/usb/serial/opticon.c
index e2bed477ad57..80e332e14384 100644
--- a/drivers/usb/serial/opticon.c
+++ b/drivers/usb/serial/opticon.c
@@ -370,6 +370,7 @@ static void opticon_port_remove(struct usb_serial_port *port)
 {
 	struct opticon_private *priv = usb_get_serial_port_data(port);
 
+	usb_kill_anchored_urbs(&priv->anchor);
 	kfree(priv);
 }
 
-- 
2.34.1


