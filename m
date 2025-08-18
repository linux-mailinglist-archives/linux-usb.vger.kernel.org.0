Return-Path: <linux-usb+bounces-26976-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C88CB2A179
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 14:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23A391895B23
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 12:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE7C230BE9;
	Mon, 18 Aug 2025 12:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="En8TQ5+I"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B00D274B2C
	for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 12:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755519474; cv=none; b=MoG0159fdUOhH6BTq9sGJRXU+7PT4pq0lkBSL6rnnv6VqmymC6n8aq4G8AYnlhbTTUGLJRkhMtws4Wy+qk9TGE27lAIamAmGNps6x326bZKArUN/Hi5Qu8y79VBUIWJ/11vGceg7fL1jKz+MnvGG3hQtqZjkNvFznMK2zG4ru7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755519474; c=relaxed/simple;
	bh=FnAdI+iLls8SBUMcJn27Onsh40wkyTPDRhNlfnYkNKs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=nPFg8tvFkdzke6FGngTe/9euNZlCTguoBJBNGvGb+yJ/uil7ftcW07ahn/By83uOdgR8rqfztehl65AoAcbSqM5+e78JSbL6raST4fUl171flXk+tjVvNGQwEDoXXtn2XMfbk4+JWjx8lNyKXDTacbe6uW6cVOq/AQzBmPx4d+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=En8TQ5+I; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3b9e418aab7so1885628f8f.3
        for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 05:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755519470; x=1756124270; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kgIqTNdKJkWnh2RE+c5gN6xabskyWNRFmlG0v7mSwt8=;
        b=En8TQ5+ILgWbcuW0LNJyuqP7koyGyvQUR5RR9lUCKmiieH3yEf7xR+mOiL5Gf5iQKF
         Qu2l9jvLLxhXcMO/uMoYmu7yDBTy/AlnqCS5JdewcwvXXsrBU1JWrRQ1HmfDTxahvren
         G0irvfpe1DlfOlXN/GOuBfKEf6jR515Dbd+Urr4JoxuHbup7YV2lmIfdzi4Z8JYob4pD
         GvWePPgD4R61t4CgUxeOaKLpQEKatP01FWUan+44LMTI9v00p360MgfxhMYndQ1p50jH
         BXm3jZJu+hG2IjMyvfStrri0nxGD9TcZqlM9z3S/t5gdg77dyk9Xs86plkQ8B/oOVmLS
         N2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755519470; x=1756124270;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgIqTNdKJkWnh2RE+c5gN6xabskyWNRFmlG0v7mSwt8=;
        b=jmCosuBRZcM93sXEmDYP/CCoc4ES/ItlflcgFxaVJNVoIbz68i59LyYVAvQxxZ3YIZ
         4PlbR7Fw5DfNQhA0cwwm1Jl+Kblh0AmbyGNRRETEmfxLC/JPOhSo+0x6Lpv+uBQNdEOr
         rGRA/4Bnik0MDQpbWIdH30j4Y0mAXhdjITXWJh46NzqI6w1cZn5s8y+Id2u4PSbkX+hN
         iGF854jqsJfXu3wDc1wlcO0cAOZeqQugadSGq5Xju8j3kSrqXSFRndhfyNMQ1XfBFxAw
         Fe5+UXc70fha5k5QcxqJE0UtRnG18E03ZQnWqVtc0RNcGLWr/HITwQFHMgwBQZfolWDz
         s74A==
X-Forwarded-Encrypted: i=1; AJvYcCVP4ukiGG4+lH/z79ywU7a6lEo35OCfVJKdR34CYGOF6ykP9XwW4wMyYlqGjx4v6cRAXPT+4lj384U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+pF+lub1TxX8omZzqc1ce6YM9gxwdnS0OE5CuibbuVxkDQoBl
	xdeV8uK1rELHVPGsDnpEhYoJRr72mEgjaokcP0iPg3EpimfS0Swy7aPf9fbFFtKePabYb3dSzFV
	wqhaO1W1lzA==
X-Google-Smtp-Source: AGHT+IGcpSOW+t5lYsgG8DLyCP/Wu2uBMoITqyxoaQYk/kAs6zbauLYRSO7+GroAHs1Vcq7jGBhqHGGJXHG1
X-Received: from wmte11.prod.google.com ([2002:a05:600c:8b2b:b0:459:dac7:4ea6])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:64c7:0:b0:3b8:f887:c870
 with SMTP id ffacd0b85a97d-3bc68b89d0emr6986137f8f.19.1755519469498; Mon, 18
 Aug 2025 05:17:49 -0700 (PDT)
Date: Mon, 18 Aug 2025 12:17:45 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <20250818121745.1160522-1-abarnas@google.com>
Subject: [PATCH] drivers/usb/mon/mon_bin: Style fixes
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Address various coding style issues reported by checkpatch.pl
in drivers/usb/mon/mon_bin.c to improve adherence to kernel coding style.

This patch introduces no functional changes.

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 drivers/usb/mon/mon_bin.c | 230 +++++++++++++++++++++-----------------
 1 file changed, 126 insertions(+), 104 deletions(-)

diff --git a/drivers/usb/mon/mon_bin.c b/drivers/usb/mon/mon_bin.c
index 4e30de4db1c0a..ed8adb8dff80c 100644
--- a/drivers/usb/mon/mon_bin.c
+++ b/drivers/usb/mon/mon_bin.c
@@ -62,7 +62,7 @@
  * page-sized chunks for the time being.
  */
 #define CHUNK_SIZE   PAGE_SIZE
-#define CHUNK_ALIGN(x)   (((x)+CHUNK_SIZE-1) & ~(CHUNK_SIZE-1))
+#define CHUNK_ALIGN(x)   (((x) + CHUNK_SIZE - 1) & ~(CHUNK_SIZE - 1))
=20
 /*
  * The magic limit was calculated so that it allows the monitoring
@@ -77,9 +77,9 @@
  *
  * XXX What about multi-megabyte URBs which take minutes to transfer?
  */
-#define BUFF_MAX  CHUNK_ALIGN(1200*1024)
-#define BUFF_DFL   CHUNK_ALIGN(300*1024)
-#define BUFF_MIN     CHUNK_ALIGN(8*1024)
+#define BUFF_MAX  CHUNK_ALIGN(1200 * 1024)
+#define BUFF_DFL   CHUNK_ALIGN(300 * 1024)
+#define BUFF_MIN     CHUNK_ALIGN(8 * 1024)
=20
 /*
  * The per-event API header (2 per URB).
@@ -151,9 +151,9 @@ struct mon_bin_get32 {
 };
=20
 struct mon_bin_mfetch32 {
-        u32 offvec32;
-        u32 nfetch32;
-        u32 nflush32;
+	u32 offvec32;
+	u32 nfetch32;
+	u32 nflush32;
 };
 #endif
=20
@@ -201,7 +201,7 @@ struct mon_reader_bin {
 };
=20
 static inline struct mon_bin_hdr *MON_OFF2HDR(const struct mon_reader_bin =
*rp,
-    unsigned int offset)
+					      unsigned int offset)
 {
 	return (struct mon_bin_hdr *)
 	    (rp->b_vec[offset / CHUNK_SIZE].ptr + offset % CHUNK_SIZE);
@@ -221,7 +221,7 @@ static dev_t mon_bin_dev0;
 static struct cdev mon_bin_cdev;
=20
 static void mon_buff_area_fill(const struct mon_reader_bin *rp,
-    unsigned int offset, unsigned int size);
+			       unsigned int offset, unsigned int size);
 static int mon_bin_wait_event(struct file *file, struct mon_reader_bin *rp=
);
 static int mon_alloc_buff(struct mon_pgmap *map, int npages);
 static void mon_free_buff(struct mon_pgmap *map, int npages);
@@ -230,7 +230,8 @@ static void mon_free_buff(struct mon_pgmap *map, int np=
ages);
  * This is a "chunked memcpy". It does not manipulate any counters.
  */
 static unsigned int mon_copy_to_buff(const struct mon_reader_bin *this,
-    unsigned int off, const unsigned char *from, unsigned int length)
+				     unsigned int off, const unsigned char *from,
+				     unsigned int length)
 {
 	unsigned int step_len;
 	unsigned char *buf;
@@ -241,7 +242,7 @@ static unsigned int mon_copy_to_buff(const struct mon_r=
eader_bin *this,
 		 * Determine step_len.
 		 */
 		step_len =3D length;
-		in_page =3D CHUNK_SIZE - (off & (CHUNK_SIZE-1));
+		in_page =3D CHUNK_SIZE - (off & (CHUNK_SIZE - 1));
 		if (in_page < step_len)
 			step_len =3D in_page;
=20
@@ -250,7 +251,9 @@ static unsigned int mon_copy_to_buff(const struct mon_r=
eader_bin *this,
 		 */
 		buf =3D this->b_vec[off / CHUNK_SIZE].ptr + off % CHUNK_SIZE;
 		memcpy(buf, from, step_len);
-		if ((off +=3D step_len) >=3D this->b_size) off =3D 0;
+		off +=3D step_len;
+		if (off >=3D this->b_size)
+			off =3D 0;
 		from +=3D step_len;
 		length -=3D step_len;
 	}
@@ -262,7 +265,7 @@ static unsigned int mon_copy_to_buff(const struct mon_r=
eader_bin *this,
  * The return value is an error code, not an offset.
  */
 static int copy_from_buf(const struct mon_reader_bin *this, unsigned int o=
ff,
-    char __user *to, int length)
+			 char __user *to, int length)
 {
 	unsigned int step_len;
 	unsigned char *buf;
@@ -273,7 +276,7 @@ static int copy_from_buf(const struct mon_reader_bin *t=
his, unsigned int off,
 		 * Determine step_len.
 		 */
 		step_len =3D length;
-		in_page =3D CHUNK_SIZE - (off & (CHUNK_SIZE-1));
+		in_page =3D CHUNK_SIZE - (off & (CHUNK_SIZE - 1));
 		if (in_page < step_len)
 			step_len =3D in_page;
=20
@@ -283,7 +286,11 @@ static int copy_from_buf(const struct mon_reader_bin *=
this, unsigned int off,
 		buf =3D this->b_vec[off / CHUNK_SIZE].ptr + off % CHUNK_SIZE;
 		if (copy_to_user(to, buf, step_len))
 			return -EINVAL;
-		if ((off +=3D step_len) >=3D this->b_size) off =3D 0;
+
+		off +=3D step_len;
+		if (off >=3D this->b_size)
+			off =3D 0;
+
 		to +=3D step_len;
 		length -=3D step_len;
 	}
@@ -296,16 +303,17 @@ static int copy_from_buf(const struct mon_reader_bin =
*this, unsigned int off,
  * Returns ~0 on failure.
  */
 static unsigned int mon_buff_area_alloc(struct mon_reader_bin *rp,
-    unsigned int size)
+					unsigned int size)
 {
 	unsigned int offset;
=20
-	size =3D (size + PKT_ALIGN-1) & ~(PKT_ALIGN-1);
+	size =3D (size + PKT_ALIGN - 1) & ~(PKT_ALIGN - 1);
 	if (rp->b_cnt + size > rp->b_size)
 		return ~0;
 	offset =3D rp->b_in;
 	rp->b_cnt +=3D size;
-	if ((rp->b_in +=3D size) >=3D rp->b_size)
+	rp->b_in +=3D size;
+	if (rp->b_in >=3D rp->b_size)
 		rp->b_in -=3D rp->b_size;
 	return offset;
 }
@@ -321,12 +329,12 @@ static unsigned int mon_buff_area_alloc(struct mon_re=
ader_bin *rp,
  * When a buffer would wrap, we place a filler packet to mark the space.
  */
 static unsigned int mon_buff_area_alloc_contiguous(struct mon_reader_bin *=
rp,
-    unsigned int size)
+						   unsigned int size)
 {
 	unsigned int offset;
 	unsigned int fill_size;
=20
-	size =3D (size + PKT_ALIGN-1) & ~(PKT_ALIGN-1);
+	size =3D (size + PKT_ALIGN - 1) & ~(PKT_ALIGN - 1);
 	if (rp->b_cnt + size > rp->b_size)
 		return ~0;
 	if (rp->b_in + size > rp->b_size) {
@@ -361,7 +369,6 @@ static unsigned int mon_buff_area_alloc_contiguous(stru=
ct mon_reader_bin *rp,
  */
 static void mon_buff_area_shrink(struct mon_reader_bin *rp, unsigned int s=
ize)
 {
-
 	/* size &=3D ~(PKT_ALIGN-1);  -- we're called with aligned size */
 	rp->b_cnt -=3D size;
 	if (rp->b_in < size)
@@ -375,15 +382,15 @@ static void mon_buff_area_shrink(struct mon_reader_bi=
n *rp, unsigned int size)
  */
 static void mon_buff_area_free(struct mon_reader_bin *rp, unsigned int siz=
e)
 {
-
-	size =3D (size + PKT_ALIGN-1) & ~(PKT_ALIGN-1);
+	size =3D (size + PKT_ALIGN - 1) & ~(PKT_ALIGN - 1);
 	rp->b_cnt -=3D size;
-	if ((rp->b_out +=3D size) >=3D rp->b_size)
+	rp->b_out +=3D size;
+	if (rp->b_out >=3D rp->b_size)
 		rp->b_out -=3D rp->b_size;
 }
=20
 static void mon_buff_area_fill(const struct mon_reader_bin *rp,
-    unsigned int offset, unsigned int size)
+			       unsigned int offset, unsigned int size)
 {
 	struct mon_bin_hdr *ep;
=20
@@ -394,18 +401,17 @@ static void mon_buff_area_fill(const struct mon_reade=
r_bin *rp,
 }
=20
 static inline char mon_bin_get_setup(unsigned char *setupb,
-    const struct urb *urb, char ev_type)
+				     const struct urb *urb, char ev_type)
 {
-
-	if (urb->setup_packet =3D=3D NULL)
+	if (!urb->setup_packet)
 		return 'Z';
 	memcpy(setupb, urb->setup_packet, SETUP_LEN);
 	return 0;
 }
=20
 static unsigned int mon_bin_get_data(const struct mon_reader_bin *rp,
-    unsigned int offset, struct urb *urb, unsigned int length,
-    char *flag)
+				     unsigned int offset, struct urb *urb, unsigned int length,
+				     char *flag)
 {
 	int i;
 	struct scatterlist *sg;
@@ -413,7 +419,7 @@ static unsigned int mon_bin_get_data(const struct mon_r=
eader_bin *rp,
=20
 	*flag =3D 0;
 	if (urb->num_sgs =3D=3D 0) {
-		if (urb->transfer_buffer =3D=3D NULL) {
+		if (!urb->transfer_buffer) {
 			*flag =3D 'Z';
 			return length;
 		}
@@ -433,7 +439,7 @@ static unsigned int mon_bin_get_data(const struct mon_r=
eader_bin *rp,
 				break;
 			this_len =3D min_t(unsigned int, sg->length, length);
 			offset =3D mon_copy_to_buff(rp, offset, sg_virt(sg),
-					this_len);
+						  this_len);
 			length -=3D this_len;
 		}
 		if (i =3D=3D 0)
@@ -448,7 +454,7 @@ static unsigned int mon_bin_get_data(const struct mon_r=
eader_bin *rp,
  * be used to determine the length of the whole contiguous buffer.
  */
 static unsigned int mon_bin_collate_isodesc(const struct mon_reader_bin *r=
p,
-    struct urb *urb, unsigned int ndesc)
+					    struct urb *urb, unsigned int ndesc)
 {
 	struct usb_iso_packet_descriptor *fp;
 	unsigned int length;
@@ -466,7 +472,8 @@ static unsigned int mon_bin_collate_isodesc(const struc=
t mon_reader_bin *rp,
 }
=20
 static void mon_bin_get_isodesc(const struct mon_reader_bin *rp,
-    unsigned int offset, struct urb *urb, char ev_type, unsigned int ndesc=
)
+				unsigned int offset, struct urb *urb,
+				char ev_type, unsigned int ndesc)
 {
 	struct mon_bin_isodesc *dp;
 	struct usb_iso_packet_descriptor *fp;
@@ -479,14 +486,16 @@ static void mon_bin_get_isodesc(const struct mon_read=
er_bin *rp,
 		dp->iso_off =3D fp->offset;
 		dp->iso_len =3D (ev_type =3D=3D 'S') ? fp->length : fp->actual_length;
 		dp->_pad =3D 0;
-		if ((offset +=3D sizeof(struct mon_bin_isodesc)) >=3D rp->b_size)
+		offset +=3D sizeof(struct mon_bin_isodesc);
+		if (offset  >=3D rp->b_size)
 			offset =3D 0;
+
 		fp++;
 	}
 }
=20
 static void mon_bin_event(struct mon_reader_bin *rp, struct urb *urb,
-    char ev_type, int status)
+			  char ev_type, int status)
 {
 	const struct usb_endpoint_descriptor *epd =3D &urb->ep->desc;
 	struct timespec64 ts;
@@ -512,26 +521,26 @@ static void mon_bin_event(struct mon_reader_bin *rp, =
struct urb *urb,
 	length =3D urb_length;
=20
 	if (usb_endpoint_xfer_isoc(epd)) {
-		if (urb->number_of_packets < 0) {
+		if (urb->number_of_packets < 0)
 			ndesc =3D 0;
-		} else if (urb->number_of_packets >=3D ISODESC_MAX) {
+		else if (urb->number_of_packets >=3D ISODESC_MAX)
 			ndesc =3D ISODESC_MAX;
-		} else {
+		else
 			ndesc =3D urb->number_of_packets;
-		}
+
 		if (ev_type =3D=3D 'C' && usb_urb_dir_in(urb))
 			length =3D mon_bin_collate_isodesc(rp, urb, ndesc);
 	} else {
 		ndesc =3D 0;
 	}
-	lendesc =3D ndesc*sizeof(struct mon_bin_isodesc);
+	lendesc =3D ndesc * sizeof(struct mon_bin_isodesc);
=20
 	/* not an issue unless there's a subtle bug in a HCD somewhere */
 	if (length >=3D urb->transfer_buffer_length)
 		length =3D urb->transfer_buffer_length;
=20
-	if (length >=3D rp->b_size/5)
-		length =3D rp->b_size/5;
+	if (length >=3D rp->b_size / 5)
+		length =3D rp->b_size / 5;
=20
 	if (usb_urb_dir_in(urb)) {
 		if (ev_type =3D=3D 'S') {
@@ -550,7 +559,7 @@ static void mon_bin_event(struct mon_reader_bin *rp, st=
ruct urb *urb,
=20
 	if (rp->mmap_active) {
 		offset =3D mon_buff_area_alloc_contiguous(rp,
-						 length + PKT_SIZE + lendesc);
+							length + PKT_SIZE + lendesc);
 	} else {
 		offset =3D mon_buff_area_alloc(rp, length + PKT_SIZE + lendesc);
 	}
@@ -561,7 +570,9 @@ static void mon_bin_event(struct mon_reader_bin *rp, st=
ruct urb *urb,
 	}
=20
 	ep =3D MON_OFF2HDR(rp, offset);
-	if ((offset +=3D PKT_SIZE) >=3D rp->b_size) offset =3D 0;
+	offset +=3D PKT_SIZE;
+	if (offset >=3D rp->b_size)
+		offset =3D 0;
=20
 	/*
 	 * Fill the allocated area.
@@ -572,7 +583,7 @@ static void mon_bin_event(struct mon_reader_bin *rp, st=
ruct urb *urb,
 	ep->epnum =3D dir | usb_endpoint_num(epd);
 	ep->devnum =3D urb->dev->devnum;
 	ep->busnum =3D urb->dev->bus->busnum;
-	ep->id =3D (unsigned long) urb;
+	ep->id =3D (unsigned long)urb;
 	ep->ts_sec =3D ts.tv_sec;
 	ep->ts_usec =3D ts.tv_nsec / NSEC_PER_USEC;
 	ep->status =3D status;
@@ -589,26 +600,26 @@ static void mon_bin_event(struct mon_reader_bin *rp, =
struct urb *urb,
 		ep->s.iso.numdesc =3D urb->number_of_packets;
 	}
=20
-	if (usb_endpoint_xfer_control(epd) && ev_type =3D=3D 'S') {
+	if (usb_endpoint_xfer_control(epd) && ev_type =3D=3D 'S')
 		ep->flag_setup =3D mon_bin_get_setup(ep->s.setup, urb, ev_type);
-	} else {
+	else
 		ep->flag_setup =3D '-';
-	}
=20
 	if (ndesc !=3D 0) {
 		ep->ndesc =3D ndesc;
 		mon_bin_get_isodesc(rp, offset, urb, ev_type, ndesc);
-		if ((offset +=3D lendesc) >=3D rp->b_size)
+		offset +=3D lendesc;
+		if (offset >=3D rp->b_size)
 			offset -=3D rp->b_size;
 	}
=20
 	if (length !=3D 0) {
 		length =3D mon_bin_get_data(rp, offset, urb, length,
-				&ep->flag_data);
+					  &ep->flag_data);
 		if (length > 0) {
-			delta =3D (ep->len_cap + PKT_ALIGN-1) & ~(PKT_ALIGN-1);
+			delta =3D (ep->len_cap + PKT_ALIGN - 1) & ~(PKT_ALIGN - 1);
 			ep->len_cap -=3D length;
-			delta -=3D (ep->len_cap + PKT_ALIGN-1) & ~(PKT_ALIGN-1);
+			delta -=3D (ep->len_cap + PKT_ALIGN - 1) & ~(PKT_ALIGN - 1);
 			mon_buff_area_shrink(rp, delta);
 		}
 	} else {
@@ -623,12 +634,14 @@ static void mon_bin_event(struct mon_reader_bin *rp, =
struct urb *urb,
 static void mon_bin_submit(void *data, struct urb *urb)
 {
 	struct mon_reader_bin *rp =3D data;
+
 	mon_bin_event(rp, urb, 'S', -EINPROGRESS);
 }
=20
 static void mon_bin_complete(void *data, struct urb *urb, int status)
 {
 	struct mon_reader_bin *rp =3D data;
+
 	mon_bin_event(rp, urb, 'C', status);
 }
=20
@@ -660,7 +673,7 @@ static void mon_bin_error(void *data, struct urb *urb, =
int error)
 	ep->epnum |=3D usb_endpoint_num(&urb->ep->desc);
 	ep->devnum =3D urb->dev->devnum;
 	ep->busnum =3D urb->dev->bus->busnum;
-	ep->id =3D (unsigned long) urb;
+	ep->id =3D (unsigned long)urb;
 	ep->ts_sec =3D ts.tv_sec;
 	ep->ts_usec =3D ts.tv_nsec / NSEC_PER_USEC;
 	ep->status =3D error;
@@ -682,18 +695,18 @@ static int mon_bin_open(struct inode *inode, struct f=
ile *file)
=20
 	mutex_lock(&mon_lock);
 	mbus =3D mon_bus_lookup(iminor(inode));
-	if (mbus =3D=3D NULL) {
+	if (!mbus) {
 		mutex_unlock(&mon_lock);
 		return -ENODEV;
 	}
-	if (mbus !=3D &mon_bus0 && mbus->u_bus =3D=3D NULL) {
-		printk(KERN_ERR TAG ": consistency error on open\n");
+	if (mbus !=3D &mon_bus0 && !mbus->u_bus) {
+		pr_err(TAG ": consistency error on open\n");
 		mutex_unlock(&mon_lock);
 		return -ENODEV;
 	}
=20
-	rp =3D kzalloc(sizeof(struct mon_reader_bin), GFP_KERNEL);
-	if (rp =3D=3D NULL) {
+	rp =3D kzalloc(sizeof(*rp), GFP_KERNEL);
+	if (!rp) {
 		rc =3D -ENOMEM;
 		goto err_alloc;
 	}
@@ -702,13 +715,15 @@ static int mon_bin_open(struct inode *inode, struct f=
ile *file)
 	mutex_init(&rp->fetch_lock);
 	rp->b_size =3D BUFF_DFL;
=20
-	size =3D sizeof(struct mon_pgmap) * (rp->b_size/CHUNK_SIZE);
-	if ((rp->b_vec =3D kzalloc(size, GFP_KERNEL)) =3D=3D NULL) {
+	size =3D sizeof(struct mon_pgmap) * (rp->b_size / CHUNK_SIZE);
+	rp->b_vec =3D kzalloc(size, GFP_KERNEL);
+	if (!rp->b_vec) {
 		rc =3D -ENOMEM;
 		goto err_allocvec;
 	}
=20
-	if ((rc =3D mon_alloc_buff(rp->b_vec, rp->b_size/CHUNK_SIZE)) < 0)
+	rc =3D mon_alloc_buff(rp->b_vec, rp->b_size / CHUNK_SIZE);
+	if (rc < 0)
 		goto err_allocbuff;
=20
 	rp->r.m_bus =3D mbus;
@@ -738,8 +753,8 @@ static int mon_bin_open(struct inode *inode, struct fil=
e *file)
  * Returns zero or error.
  */
 static int mon_bin_get_event(struct file *file, struct mon_reader_bin *rp,
-    struct mon_bin_hdr __user *hdr, unsigned int hdrbytes,
-    void __user *data, unsigned int nbytes)
+			     struct mon_bin_hdr __user *hdr, unsigned int hdrbytes,
+			     void __user *data, unsigned int nbytes)
 {
 	unsigned long flags;
 	struct mon_bin_hdr *ep;
@@ -749,7 +764,8 @@ static int mon_bin_get_event(struct file *file, struct =
mon_reader_bin *rp,
=20
 	mutex_lock(&rp->fetch_lock);
=20
-	if ((rc =3D mon_bin_wait_event(file, rp)) < 0) {
+	rc =3D mon_bin_wait_event(file, rp);
+	if (rc < 0) {
 		mutex_unlock(&rp->fetch_lock);
 		return rc;
 	}
@@ -762,7 +778,9 @@ static int mon_bin_get_event(struct file *file, struct =
mon_reader_bin *rp,
 	}
=20
 	step_len =3D min(ep->len_cap, nbytes);
-	if ((offset =3D rp->b_out + PKT_SIZE) >=3D rp->b_size) offset =3D 0;
+	offset =3D rp->b_out + PKT_SIZE;
+	if (offset >=3D rp->b_size)
+		offset =3D 0;
=20
 	if (copy_from_buf(rp, offset, data, step_len)) {
 		mutex_unlock(&rp->fetch_lock);
@@ -781,18 +799,18 @@ static int mon_bin_get_event(struct file *file, struc=
t mon_reader_bin *rp,
 static int mon_bin_release(struct inode *inode, struct file *file)
 {
 	struct mon_reader_bin *rp =3D file->private_data;
-	struct mon_bus* mbus =3D rp->r.m_bus;
+	struct mon_bus *mbus =3D rp->r.m_bus;
=20
 	mutex_lock(&mon_lock);
=20
 	if (mbus->nreaders <=3D 0) {
-		printk(KERN_ERR TAG ": consistency error on close\n");
+		pr_err(TAG ": consistency error on close\n");
 		mutex_unlock(&mon_lock);
 		return 0;
 	}
 	mon_reader_del(mbus, &rp->r);
=20
-	mon_free_buff(rp->b_vec, rp->b_size/CHUNK_SIZE);
+	mon_free_buff(rp->b_vec, rp->b_size / CHUNK_SIZE);
 	kfree(rp->b_vec);
 	kfree(rp);
=20
@@ -801,7 +819,7 @@ static int mon_bin_release(struct inode *inode, struct =
file *file)
 }
=20
 static ssize_t mon_bin_read(struct file *file, char __user *buf,
-    size_t nbytes, loff_t *ppos)
+			    size_t nbytes, loff_t *ppos)
 {
 	struct mon_reader_bin *rp =3D file->private_data;
 	unsigned int hdrbytes =3D PKT_SZ_API0;
@@ -815,7 +833,8 @@ static ssize_t mon_bin_read(struct file *file, char __u=
ser *buf,
=20
 	mutex_lock(&rp->fetch_lock);
=20
-	if ((rc =3D mon_bin_wait_event(file, rp)) < 0) {
+	rc =3D mon_bin_wait_event(file, rp);
+	if (rc < 0) {
 		mutex_unlock(&rp->fetch_lock);
 		return rc;
 	}
@@ -872,7 +891,7 @@ static ssize_t mon_bin_read(struct file *file, char __u=
ser *buf,
  * Remove at most nevents from chunked buffer.
  * Returns the number of removed events.
  */
-static int mon_bin_flush(struct mon_reader_bin *rp, unsigned nevents)
+static int mon_bin_flush(struct mon_reader_bin *rp, unsigned int nevents)
 {
 	unsigned long flags;
 	struct mon_bin_hdr *ep;
@@ -899,7 +918,7 @@ static int mon_bin_flush(struct mon_reader_bin *rp, uns=
igned nevents)
  * Return the effective number of events fetched.
  */
 static int mon_bin_fetch(struct file *file, struct mon_reader_bin *rp,
-    u32 __user *vec, unsigned int max)
+			 u32 __user *vec, unsigned int max)
 {
 	unsigned int cur_out;
 	unsigned int bytes, avail;
@@ -911,7 +930,8 @@ static int mon_bin_fetch(struct file *file, struct mon_=
reader_bin *rp,
=20
 	mutex_lock(&rp->fetch_lock);
=20
-	if ((rc =3D mon_bin_wait_event(file, rp)) < 0) {
+	rc =3D mon_bin_wait_event(file, rp);
+	if (rc < 0) {
 		mutex_unlock(&rp->fetch_lock);
 		return rc;
 	}
@@ -935,8 +955,9 @@ static int mon_bin_fetch(struct file *file, struct mon_=
reader_bin *rp,
=20
 		nevents++;
 		size =3D ep->len_cap + PKT_SIZE;
-		size =3D (size + PKT_ALIGN-1) & ~(PKT_ALIGN-1);
-		if ((cur_out +=3D size) >=3D rp->b_size)
+		size =3D (size + PKT_ALIGN - 1) & ~(PKT_ALIGN - 1);
+		cur_out +=3D size;
+		if (cur_out >=3D rp->b_size)
 			cur_out -=3D rp->b_size;
 		bytes +=3D size;
 	}
@@ -972,8 +993,9 @@ static int mon_bin_queued(struct mon_reader_bin *rp)
=20
 		nevents++;
 		size =3D ep->len_cap + PKT_SIZE;
-		size =3D (size + PKT_ALIGN-1) & ~(PKT_ALIGN-1);
-		if ((cur_out +=3D size) >=3D rp->b_size)
+		size =3D (size + PKT_ALIGN - 1) & ~(PKT_ALIGN - 1);
+		cur_out +=3D size;
+		if (cur_out >=3D rp->b_size)
 			cur_out -=3D rp->b_size;
 		bytes +=3D size;
 	}
@@ -993,7 +1015,6 @@ static long mon_bin_ioctl(struct file *file, unsigned =
int cmd, unsigned long arg
 	unsigned long flags;
=20
 	switch (cmd) {
-
 	case MON_IOCQ_URB_LEN:
 		/*
 		 * N.B. This only returns the size of data, without the header.
@@ -1029,12 +1050,12 @@ static long mon_bin_ioctl(struct file *file, unsign=
ed int cmd, unsigned long arg
 		size =3D CHUNK_ALIGN(arg);
 		vec =3D kcalloc(size / CHUNK_SIZE, sizeof(struct mon_pgmap),
 			      GFP_KERNEL);
-		if (vec =3D=3D NULL) {
+		if (!vec) {
 			ret =3D -ENOMEM;
 			break;
 		}
=20
-		ret =3D mon_alloc_buff(vec, size/CHUNK_SIZE);
+		ret =3D mon_alloc_buff(vec, size / CHUNK_SIZE);
 		if (ret < 0) {
 			kfree(vec);
 			break;
@@ -1043,15 +1064,18 @@ static long mon_bin_ioctl(struct file *file, unsign=
ed int cmd, unsigned long arg
 		mutex_lock(&rp->fetch_lock);
 		spin_lock_irqsave(&rp->b_lock, flags);
 		if (rp->mmap_active) {
-			mon_free_buff(vec, size/CHUNK_SIZE);
+			mon_free_buff(vec, size / CHUNK_SIZE);
 			kfree(vec);
 			ret =3D -EBUSY;
 		} else {
-			mon_free_buff(rp->b_vec, rp->b_size/CHUNK_SIZE);
+			mon_free_buff(rp->b_vec, rp->b_size / CHUNK_SIZE);
 			kfree(rp->b_vec);
 			rp->b_vec  =3D vec;
 			rp->b_size =3D size;
-			rp->b_read =3D rp->b_in =3D rp->b_out =3D rp->b_cnt =3D 0;
+			rp->b_read =3D 0;
+			rp->b_in =3D 0;
+			rp->b_out =3D 0;
+			rp->b_cnt =3D 0;
 			rp->cnt_lost =3D 0;
 		}
 		spin_unlock_irqrestore(&rp->b_lock, flags);
@@ -1068,15 +1092,15 @@ static long mon_bin_ioctl(struct file *file, unsign=
ed int cmd, unsigned long arg
 		{
 		struct mon_bin_get getb;
=20
-		if (copy_from_user(&getb, (void __user *)arg,
-					    sizeof(struct mon_bin_get)))
+		if (copy_from_user(&getb, (void __user *)arg, sizeof(struct mon_bin_get)=
))
 			return -EFAULT;
=20
 		if (getb.alloc > 0x10000000)	/* Want to cast to u32 */
 			return -EINVAL;
+
 		ret =3D mon_bin_get_event(file, rp, getb.hdr,
-		    (cmd =3D=3D MON_IOCX_GET)? PKT_SZ_API0: PKT_SZ_API1,
-		    getb.data, (unsigned int)getb.alloc);
+					(cmd =3D=3D MON_IOCX_GET) ? PKT_SZ_API0 : PKT_SZ_API1,
+					getb.data, (unsigned int)getb.alloc);
 		}
 		break;
=20
@@ -1122,7 +1146,6 @@ static long mon_bin_ioctl(struct file *file, unsigned=
 int cmd, unsigned long arg
 			return -EFAULT;
 		if (put_user(nevents, &sp->queued))
 			return -EFAULT;
-
 		}
 		break;
=20
@@ -1135,25 +1158,23 @@ static long mon_bin_ioctl(struct file *file, unsign=
ed int cmd, unsigned long arg
=20
 #ifdef CONFIG_COMPAT
 static long mon_bin_compat_ioctl(struct file *file,
-    unsigned int cmd, unsigned long arg)
+				 unsigned int cmd, unsigned long arg)
 {
 	struct mon_reader_bin *rp =3D file->private_data;
 	int ret;
=20
 	switch (cmd) {
-
 	case MON_IOCX_GET32:
 	case MON_IOCX_GETX32:
 		{
 		struct mon_bin_get32 getb;
=20
-		if (copy_from_user(&getb, (void __user *)arg,
-					    sizeof(struct mon_bin_get32)))
+		if (copy_from_user(&getb, (void __user *)arg, sizeof(struct mon_bin_get3=
2)))
 			return -EFAULT;
=20
 		ret =3D mon_bin_get_event(file, rp, compat_ptr(getb.hdr32),
-		    (cmd =3D=3D MON_IOCX_GET32)? PKT_SZ_API0: PKT_SZ_API1,
-		    compat_ptr(getb.data32), getb.alloc32);
+					(cmd =3D=3D MON_IOCX_GET32) ? PKT_SZ_API0 : PKT_SZ_API1,
+					compat_ptr(getb.data32), getb.alloc32);
 		if (ret < 0)
 			return ret;
 		}
@@ -1164,7 +1185,7 @@ static long mon_bin_compat_ioctl(struct file *file,
 		struct mon_bin_mfetch32 mfetch;
 		struct mon_bin_mfetch32 __user *uptr;
=20
-		uptr =3D (struct mon_bin_mfetch32 __user *) compat_ptr(arg);
+		uptr =3D (struct mon_bin_mfetch32 __user *)compat_ptr(arg);
=20
 		if (copy_from_user(&mfetch, uptr, sizeof(mfetch)))
 			return -EFAULT;
@@ -1177,7 +1198,7 @@ static long mon_bin_compat_ioctl(struct file *file,
 				return -EFAULT;
 		}
 		ret =3D mon_bin_fetch(file, rp, compat_ptr(mfetch.offvec32),
-		    mfetch.nfetch32);
+				    mfetch.nfetch32);
 		if (ret < 0)
 			return ret;
 		if (put_user(ret, &uptr->nfetch32))
@@ -1186,7 +1207,7 @@ static long mon_bin_compat_ioctl(struct file *file,
 		return 0;
=20
 	case MON_IOCG_STATS:
-		return mon_bin_ioctl(file, cmd, (unsigned long) compat_ptr(arg));
+		return mon_bin_ioctl(file, cmd, (unsigned long)compat_ptr(arg));
=20
 	case MON_IOCQ_URB_LEN:
 	case MON_IOCQ_RING_SIZE:
@@ -1195,7 +1216,7 @@ static long mon_bin_compat_ioctl(struct file *file,
 		return mon_bin_ioctl(file, cmd, arg);
=20
 	default:
-		;
+		break;
 	}
 	return -ENOTTY;
 }
@@ -1237,6 +1258,7 @@ static void mon_bin_vma_close(struct vm_area_struct *=
vma)
 	unsigned long flags;
=20
 	struct mon_reader_bin *rp =3D vma->vm_private_data;
+
 	spin_lock_irqsave(&rp->b_lock, flags);
 	rp->mmap_active--;
 	spin_unlock_irqrestore(&rp->b_lock, flags);
@@ -1343,11 +1365,11 @@ static int mon_alloc_buff(struct mon_pgmap *map, in=
t npages)
 		vaddr =3D get_zeroed_page(GFP_KERNEL);
 		if (vaddr =3D=3D 0) {
 			while (n-- !=3D 0)
-				free_page((unsigned long) map[n].ptr);
+				free_page((unsigned long)map[n].ptr);
 			return -ENOMEM;
 		}
-		map[n].ptr =3D (unsigned char *) vaddr;
-		map[n].pg =3D virt_to_page((void *) vaddr);
+		map[n].ptr =3D (unsigned char *)vaddr;
+		map[n].pg =3D virt_to_page((void *)vaddr);
 	}
 	return 0;
 }
@@ -1357,13 +1379,13 @@ static void mon_free_buff(struct mon_pgmap *map, in=
t npages)
 	int n;
=20
 	for (n =3D 0; n < npages; n++)
-		free_page((unsigned long) map[n].ptr);
+		free_page((unsigned long)map[n].ptr);
 }
=20
 int mon_bin_add(struct mon_bus *mbus, const struct usb_bus *ubus)
 {
 	struct device *dev;
-	unsigned minor =3D ubus? ubus->busnum: 0;
+	unsigned int minor =3D ubus ? ubus->busnum : 0;
=20
 	if (minor >=3D MON_BIN_MAX_MINOR)
 		return 0;
--=20
2.51.0.rc1.167.g924127e9c0-goog


